import { LightningElement, api,track } from 'lwc';
import skeleton from '@salesforce/resourceUrl/skeleton';
import LaserHairRemoval from '@salesforce/resourceUrl/LaserHairRemoval';
import Emsculpt from '@salesforce/resourceUrl/Emsculpt';
import Ipl from '@salesforce/resourceUrl/Ipl';
import Kybella from '@salesforce/resourceUrl/Kybella';
import Laseveinremoval from '@salesforce/resourceUrl/Laseveinremoval';
import MicroDermAbrasion from '@salesforce/resourceUrl/MicroDermAbrasion';
import microneedlingAndSkinPenDetails from '@salesforce/resourceUrl/microneedlingAndSkinPenDetails';
import PeelTreatment from '@salesforce/resourceUrl/PeelTreatment';
import Trusculptt from '@salesforce/resourceUrl/Trusculptt';
import sculptraProcedure from '@salesforce/resourceUrl/sculptraProcedure';
import Coolsculpting from '@salesforce/resourceUrl/Coolsculpting';
import BotoxDysport from '@salesforce/resourceUrl/BotoxDysport';
import DermaFiller from '@salesforce/resourceUrl/Dermafiller';
import  saveImageToSalesforce  from '@salesforce/apex/ImageUploadController.saveImageToSalesforce2';
import Ultherypyone_Five from '@salesforce/resourceUrl/Ultherypyone_Five';
import ultherpythreePointzero from '@salesforce/resourceUrl/ultherpythreePointzero';
import ultfourPointFive from '@salesforce/resourceUrl/ultfourPointFive';
import three from '@salesforce/resourceUrl/three';
import fourPointFiveMMNeck from '@salesforce/resourceUrl/fourPointFiveMMNeck';
import ThreePointZeroMMChest from '@salesforce/resourceUrl/ThreePointZeroMMChest';
import fourPointFiveMMChest from '@salesforce/resourceUrl/fourPointFiveMMChest';
import Coolsculpting2 from '@salesforce/resourceUrl/Coolsculpting2';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ImageMarkup extends LightningElement {
    @api imageUrl;
    @api recordId;
    @api treatmentType;
    @api contentDocumentId ;
     @api name;
     saveDisabled = false ;
      @track isLoading = false;


    imageCanvas;
    imageCtx;
    markupCanvas;
    markupCtx;
    isDrawing = false;
    activeTool = null;
    penColor = '#000000';
    textInput = null;
    selectedNumber = '1';
    startX = 0;
    startY = 0;
    scale = 1;
    scaleStep = 0.1;

    connectedCallback() {
        this.setImageUrl();
         console.log('recordId;: ', this.recordId);
    }

    renderedCallback() {
        if (!this.imageCanvas) {
            this.imageCanvas = this.template.querySelector('.image-canvas');
            this.markupCanvas = this.template.querySelector('.markup-canvas');
            const image = new Image();
            image.src = this.imageUrl;
            image.onload = this.handleImageLoad.bind(this);
        }
    }

    setImageUrl() {
        const treatmentImages = {
             '1.5 mm Face': Ultherypyone_Five,
              '3.0 mm Face': ultherpythreePointzero,
               '4.5 mm Face': ultfourPointFive,
                '3.0 mm Neck': three,
                 '4.5 mm Neck': fourPointFiveMMNeck,
                  '3.0 mm Chest': ThreePointZeroMMChest,
                   '4.5 mm Chest': fourPointFiveMMChest,
            'Dermal Filler': skeleton,
            'Dermalplanning': LaserHairRemoval,
            'Botox/Dysport': BotoxDysport,
            'Emsculpt': Emsculpt,
            'Facial': LaserHairRemoval,
            'Fractional Laser': LaserHairRemoval,
            'Hydrafacial': LaserHairRemoval,
            'Kybella': Kybella,
            'Coolsculpting': Coolsculpting,
            'IPL': Ipl,
            'Laser Hair Removal': LaserHairRemoval,
            'Laser Vein Removal': Laseveinremoval,
            'Microdermabrasion': MicroDermAbrasion,
            'Sculptra Body': sculptraProcedure,
            'SkinPen Microneedling': microneedlingAndSkinPenDetails,
            'Tattoo Removal': LaserHairRemoval,
            'TruSculpt': Trusculptt,
            'Vanquish': Trusculptt,
            'Weight Loss Injections': LaserHairRemoval,
            'Peel': PeelTreatment,
            'PeelTreatment': PeelTreatment,
            'Derma Filler': DermaFiller,
             'Coolsculpting2': Coolsculpting2,
            
        };

        this.imageUrl = treatmentImages[this.treatmentType];
        console.log('imageUrl: ', this.imageUrl);
        console.log('treatmentType: ', this.treatmentType);
    }

    handleImageLoad(event) {
        const image = event.target;
        this.imageCanvas.width = image.width;
        this.imageCanvas.height = image.height;
        this.imageCtx = this.imageCanvas.getContext('2d');
        this.imageCtx.drawImage(image, 0, 0);

        this.markupCanvas.width = image.width;
        this.markupCanvas.height = image.height;
        this.markupCtx = this.markupCanvas.getContext('2d');

        this.addCanvasEventListeners();
    }

    addCanvasEventListeners() {
        this.markupCanvas.addEventListener('mousedown', this.startDrawing.bind(this));
        this.markupCanvas.addEventListener('mousemove', this.drawOrErase.bind(this));
        this.markupCanvas.addEventListener('mouseup', this.stopDrawing.bind(this));
        this.markupCanvas.addEventListener('mouseout', this.stopDrawing.bind(this));
        this.markupCanvas.addEventListener('click', this.handleCanvasClick.bind(this));
    }

    toggleToolMode(event) {
        const tool = event.currentTarget.dataset.tool;
        this.activeTool = this.activeTool === tool ? null : tool;
        this.updateButtonStates();
    }

    updateButtonStates() {
        const buttons = this.template.querySelectorAll('[data-tool]');
        buttons.forEach(button => {
            button.classList.toggle('active', button.dataset.tool === this.activeTool);
        });
    }

    handleColorChange(event) {
        this.penColor = event.target.value;
    }

    openColorPicker(event) {
        const colorPicker = event.currentTarget.querySelector('.color-picker');
        colorPicker.click();
    }

    startDrawing(event) {
        if (!['pen', 'eraser', 'line'].includes(this.activeTool)) return;
        this.isDrawing = true;
        this.lastX = event.offsetX;
        this.lastY = event.offsetY;

        if (this.activeTool === 'line') {
            this.startX = event.offsetX;
            this.startY = event.offsetY;
        }
    }

    drawOrErase(event) {
        if (!this.isDrawing) return;
        const x = event.offsetX;
        const y = event.offsetY;

        if (this.activeTool === 'pen') {
            this.markupCtx.strokeStyle = this.penColor;
            this.markupCtx.lineWidth = 2;
            this.markupCtx.lineJoin = 'round';
            this.markupCtx.lineCap = 'round';
            this.markupCtx.beginPath();
            this.markupCtx.moveTo(this.lastX, this.lastY);
            this.markupCtx.lineTo(x, y);
            this.markupCtx.stroke();
            this.markupCtx.closePath();
            this.lastX = x;
            this.lastY = y;
        } else if (this.activeTool === 'eraser') {
            this.markupCtx.clearRect(x, y, 10, 10);
        }
    }

    stopDrawing(event) {
        if (this.activeTool === 'line' && this.isDrawing) {
            this.markupCtx.strokeStyle = this.penColor;
            this.markupCtx.lineWidth = 2;
            this.markupCtx.globalCompositeOperation = 'source-over';

            this.markupCtx.beginPath();
            this.markupCtx.moveTo(this.startX, this.startY);
            this.markupCtx.lineTo(event.offsetX, event.offsetY);
            this.markupCtx.stroke();
        }
        this.isDrawing = false;
    }


    handleCanvasClick(event) {
        if (this.activeTool === 'text') {
            this.createTextInput(event.offsetX, event.offsetY);
        } else if (this.activeTool === 'date') {
            this.stampDate(event.offsetX, event.offsetY);
        } else if (this.activeTool === 'numberStamp') {
            this.stampNumber(event.offsetX, event.offsetY);
        }
    }

    createTextInput(x, y) {
        this.clearTextInput();
        this.textInput = document.createElement('input');
        this.textInput.type = 'text';
        this.textInput.style.position = 'absolute';
        this.textInput.style.left = `${x}px`;
        this.textInput.style.top = `${y}px`;
        this.textInput.style.color = this.penColor;
        this.textInput.style.border = '1px solid #000';
        this.textInput.style.backgroundColor = 'transparent';
        this.textInput.addEventListener('keydown', this.handleTextInputKeyDown.bind(this));
        this.textInput.addEventListener('blur', this.handleTextInputBlur.bind(this));
        this.template.querySelector('.canvas-container').appendChild(this.textInput);
        this.textInput.focus();
    }

    clearTextInput() {
        if (this.textInput) {
            this.textInput.remove();
            this.textInput = null;
        }
    }

    handleTextInputKeyDown(event) {
        if (event.key === 'Enter') {
            this.stampText(event.target.value, parseInt(event.target.style.left), parseInt(event.target.style.top));
            this.clearTextInput();
        }
    }

    handleTextInputBlur(event) {
        this.stampText(event.target.value, parseInt(event.target.style.left), parseInt(event.target.style.top));
        this.clearTextInput();
    }

    stampText(text, x, y) {
        this.markupCtx.fillStyle = this.penColor;
        this.markupCtx.font = '16px Arial';
        this.markupCtx.fillText(text, x, y);
    }

    stampDate(x, y) {
        const date = new Date().toLocaleDateString();
        this.markupCtx.fillStyle = this.penColor;
        this.markupCtx.font = '16px Arial';
        this.markupCtx.fillText(date, x, y);
    }

    stampNumber(x, y) {
        this.markupCtx.fillStyle = this.penColor;
        this.markupCtx.font = '16px Arial';
        this.markupCtx.fillText(this.selectedNumber, x, y);
    }

    handleNumberChange(event) {
        this.selectedNumber = event.target.value;
    }

    zoomIn() {
        this.scale += this.scaleStep;
        this.applyZoom();
    }

    zoomOut() {
        if (this.scale > this.scaleStep) {
            this.scale -= this.scaleStep;
            this.applyZoom();
        }
    }

    applyZoom() {
        this.markupCanvas.style.transform = `scale(${this.scale})`;
        this.imageCanvas.style.transform = `scale(${this.scale})`;
    }

   saveImage() {
    this.isLoading = true;
    const finalCanvas = document.createElement('canvas');
    finalCanvas.width = this.imageCanvas.width;
    finalCanvas.height = this.imageCanvas.height;
    const finalCtx = finalCanvas.getContext('2d');

    finalCtx.drawImage(this.imageCanvas, 0, 0);
    finalCtx.drawImage(this.markupCanvas, 0, 0);

    const dataUrl = finalCanvas.toDataURL('image/png');

    saveImageToSalesforce({ base64Data: dataUrl })
        .then(result => {
            this.isLoading = false;
            console.log(result);
            if (result) {
                this.name = result; // Set the contentDocumentId attribute

                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Image uploaded successfully',
                        variant: 'success',
                    })
                );
                this.saveDisabled = true; // Disable the save button
            } else {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error',
                        message: 'Error uploading image',
                        variant: 'error',
                    })
                );
            }
        })
        .catch(error => {
            console.error('Error uploading image:', error);
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error',
                    message: 'Error uploading image',
                    variant: 'error',
                })
            );
        });
}

}
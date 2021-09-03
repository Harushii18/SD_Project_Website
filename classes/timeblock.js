export class TimeBlock{
  constructor(document, weekNo){
    //Class attributes
    this.currDiv = document.createElement('div'); //NB
    this.weekNo = weekNo; //NB
    this.startDate = new Date(); //NB
    this.assigned = ""; //When dropped on this timeblock, value will be the name of the specialty

    //Initially set start date to first day of the year
    this.startDate.setDate(1);
    this.startDate.setMonth(0);
    this.startDate.setYear(2021); //Change to current year - for every year

    this.startDate.setDate(1+ (7*this.weekNo) );

    //Set End Date
    this.endDate = this.startDate; //NB
    this.endDate.setDate(this.endDate.getDate()+6);

    //DOM element
    this.document = document;

    //Div attributes for each div block in the timeline
    this.currDiv.style.width = '60px';
    this.currDiv.style.height = '10px';
    this.currDiv.style.padding = '10px';
    this.currDiv.style.display = 'flex';
    this.currDiv.style.border = "1px solid #aaaaaa";
    this.currDiv.style.alignItems = 'center';


    //this.setAttributeOfDiv("ondrop","drop(event)")
    //this.setAttributeOfDiv("ondragover","allowDrop(event)")

  }

  //Getter Methods
    getWeekNo(){
      return this.weekNo;
    }

    getAssigned(){
      return this.assigned;
    }

    getStartDate(){
      return this.startDate;
    }

    getEndDate(){
      return this.endDate;
    }

  //Setter Methods
  setAssigned(specialty){
    this.assigned = specialty;
  }



  setAttributeOfDiv(attribute, attributeValue){
    this.currDiv.setAttribute(attribute,attributeValue);
  }

  //Return td with div appended to it
  returnTD(){
    var td = this.document.createElement('td');
    td.appendChild(this.currDiv);
    return td;
  }

  //Testing
  output(message){
    console.log(message);
  }

}

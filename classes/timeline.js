export class Timeline{
  constructor(document){

    this.document = document;
    this.timeBlocks = []

    //Append the tr (with the 52 time blocks) to a table
    var table = this.document.createElement('table');
    var tr = this.setTimeBlocks();
    table.appendChild(tr);

    //Append the table to a new row
    var tr = this.document.createElement('tr');
    tr.appendChild(table);


    //This div holds the timeline (All 52 div blocks)
    var containter = this.document.createElement('div');
    containter.appendChild(tr);
    //Need to dynamically set the width and height in the future (So the timeline adjusts size with the window size of the browser)
    //Note: I think we need to use window.InnerWidth and window.InnerHeight here but we'll come back to this at some point.
    containter.style.height = "50px";
    containter.style.width = "1800px";
    containter.style.overflow = 'scroll';
    containter.style.alignItems = 'center';

    //This is the complete timeline
    this.timeline = container;

  }






//Set time blocks and return a tr with all 52 timeblocks appended to it
  setTimeBlocks(){
    var tr = document.createElement('tr');
    //Create 52 div blocks
    for(let i = 1; i<=52;i++){ //Loop Counter is set like this to keep track of the week number
           var currTimeBlock = new TimeBlock(this.document,i);
           //currTimeBlock.output("yes"); //Testing

           currTimeBlock.setAttributeOfDiv("ondrop","drop(event)")
           currTimeBlock.setAttributeOfDiv("ondragover","allowDrop(event)")

           tr.appendChild(currTimeBlock.returnTD());
           this.timeBlocks.push(currTimeBlock);
       }
    return tr;
  }

getTimeline(){
  return this.timeline;
}

}

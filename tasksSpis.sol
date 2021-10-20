pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

contract tasksSpis {
    
    struct Task {
        string name;
        uint time;
        bool OK;
    }

    Task[] taskArr;
    Task[] notOKTaskArr;
    Task[] OKTaskArr;
    mapping (uint=>Task) taskNum;


    function createTask (string name, uint time) public{
        tvm.accept();
        taskArr.push(Task(name,time,false));
        notOKTaskArr.push(Task(name,time,false));
        uint keyAsLastNum = taskArr.length + 1;
        taskNum[keyAsLastNum] = Task(name,time,false);

    }

    function getTasksVal () public returns (uint) {
        tvm.accept();
        return  taskArr.length;


    }

    function getTasks () public returns (Task[]) {
        tvm.accept();
        return taskArr;

    }

   
    function deleteTask (uint taskId) public {
        tvm.accept();
        delete taskNum[taskId];
        delete taskArr[taskId-1];
    }
    
    function PerTask (uint taskId) public returns (Task[]) {
        tvm.accept();
        taskNum[taskId].OK=true;
        OKTaskArr.push(taskNum[taskId]);
        delete taskArr[taskId-1];
        return OKTaskArr;
    }

    function getTask(uint taskId) public view returns (Task) {
        tvm.accept();
        
        return taskNum[taskId-1];
    }
}
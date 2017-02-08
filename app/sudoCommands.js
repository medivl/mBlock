var sudo = require('./sudo-prompt');
const path = require('path');

var SudoCommands = {
    enableSerialInLinux: function(callback) {
        this.spawn('usermod -a -G dialout `whoami`', [], callback);
    },
    /**
     * 增加串口权限规则
     * @param callback
     */
    enableSerialRule: function (callback) {
        this.enableSerialInLinux(function (error, stderr, stdout) {
        });
        this.spawn( 'bash '+path.join(__root_path, 'tools/enableSerial.sh') , [], callback);
    },
    enableHIDInLinux: function(callback) {
        this.spawn( 'bash '+path.join(__root_path, 'tools/enableHID.sh') , [], callback);
    },
    spawn: function(command, args, callback) {
        var options = {
            name: 'mBlock'
        }
        sudo.exec(command, options, function(error, stdout, stderr){
            callback(error, stderr, stdout);
        });
    }
}

module.exports = SudoCommands;
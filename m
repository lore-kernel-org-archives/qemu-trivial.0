Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g86Ln-0005zE-IW
	for mharc-qemu-trivial@gnu.org; Thu, 04 Oct 2018 12:19:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1g86Ll-0005wo-FI
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 12:19:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1g86Li-0002jZ-Vl
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 12:19:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38874)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1g86LK-0002XI-MC; Thu, 04 Oct 2018 12:19:14 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D74823B3C0;
	Thu,  4 Oct 2018 16:19:10 +0000 (UTC)
Received: from dhcp-17-10.bos.redhat.com (dhcp-17-10.bos.redhat.com
	[10.18.17.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08CFE77C05;
	Thu,  4 Oct 2018 16:19:04 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Cleber Rosa <crosa@redhat.com>, qemu-trivial@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Date: Thu,  4 Oct 2018 12:18:51 -0400
Message-Id: <20181004161852.11673-10-crosa@redhat.com>
In-Reply-To: <20181004161852.11673-1-crosa@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 04 Oct 2018 16:19:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 09/10] scripts/qemu.py: use a more consistent
 docstring style
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2018 16:19:42 -0000

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 dtc             |  2 +-
 scripts/qemu.py | 65 +++++++++++++++++++++++++++++++------------------
 2 files changed, 42 insertions(+), 25 deletions(-)

diff --git a/dtc b/dtc
index 88f18909db..e54388015a 160000
--- a/dtc
+++ b/dtc
@@ -1 +1 @@
-Subproject commit 88f18909db731a627456f26d779445f84e449536
+Subproject commit e54388015af1fb4bf04d0bca99caba1074d9cc42
diff --git a/scripts/qemu.py b/scripts/qemu.py
index f099ce7278..7abe26de69 100644
--- a/scripts/qemu.py
+++ b/scripts/qemu.py
@@ -53,9 +53,9 @@ class QEMUMachineAddDeviceError(QEMUMachineError):
     """
 
 class MonitorResponseError(qmp.qmp.QMPError):
-    '''
+    """
     Represents erroneous QMP monitor reply
-    '''
+    """
     def __init__(self, reply):
         try:
             desc = reply["error"]["desc"]
@@ -66,14 +66,15 @@ class MonitorResponseError(qmp.qmp.QMPError):
 
 
 class QEMUMachine(object):
-    '''A QEMU VM
+    """
+    A QEMU VM
 
     Use this object as a context manager to ensure the QEMU process terminates::
 
         with VM(binary) as vm:
             ...
         # vm is guaranteed to be shut down here
-    '''
+    """
 
     def __init__(self, binary, args=None, wrapper=None, name=None,
                  test_dir="/var/tmp", monitor_address=None,
@@ -135,7 +136,9 @@ class QEMUMachine(object):
         self._args.append(args)
 
     def add_fd(self, fd, fdset, opaque, opts=''):
-        '''Pass a file descriptor to the VM'''
+        """
+        Pass a file descriptor to the VM
+        """
         options = ['fd=%d' % fd,
                    'set=%d' % fdset,
                    'opaque=%s' % opaque]
@@ -168,7 +171,9 @@ class QEMUMachine(object):
 
     @staticmethod
     def _remove_if_exists(path):
-        '''Remove file object at path if it exists'''
+        """
+        Remove file object at path if it exists
+        """
         try:
             os.remove(path)
         except OSError as exception:
@@ -271,7 +276,9 @@ class QEMUMachine(object):
             raise
 
     def _launch(self):
-        '''Launch the VM and establish a QMP connection'''
+        """
+        Launch the VM and establish a QMP connection
+        """
         devnull = open(os.path.devnull, 'rb')
         self._pre_launch()
         self._qemu_full_args = (self._wrapper + [self._binary] +
@@ -284,14 +291,18 @@ class QEMUMachine(object):
         self._post_launch()
 
     def wait(self):
-        '''Wait for the VM to power off'''
+        """
+        Wait for the VM to power off
+        """
         self._popen.wait()
         self._qmp.close()
         self._load_io_log()
         self._post_shutdown()
 
     def shutdown(self):
-        '''Terminate the VM and clean up'''
+        """
+        Terminate the VM and clean up
+        """
         if self.is_running():
             try:
                 self._qmp.cmd('quit')
@@ -315,7 +326,9 @@ class QEMUMachine(object):
         self._launched = False
 
     def qmp(self, cmd, conv_keys=True, **args):
-        '''Invoke a QMP command and return the response dict'''
+        """
+        Invoke a QMP command and return the response dict
+        """
         qmp_args = dict()
         for key, value in args.items():
             if conv_keys:
@@ -326,11 +339,11 @@ class QEMUMachine(object):
         return self._qmp.cmd(cmd, args=qmp_args)
 
     def command(self, cmd, conv_keys=True, **args):
-        '''
+        """
         Invoke a QMP command.
         On success return the response dict.
         On failure raise an exception.
-        '''
+        """
         reply = self.qmp(cmd, conv_keys, **args)
         if reply is None:
             raise qmp.qmp.QMPError("Monitor is closed")
@@ -339,13 +352,17 @@ class QEMUMachine(object):
         return reply["return"]
 
     def get_qmp_event(self, wait=False):
-        '''Poll for one queued QMP events and return it'''
+        """
+        Poll for one queued QMP events and return it
+        """
         if len(self._events) > 0:
             return self._events.pop(0)
         return self._qmp.pull_event(wait=wait)
 
     def get_qmp_events(self, wait=False):
-        '''Poll for queued QMP events and return a list of dicts'''
+        """
+        Poll for queued QMP events and return a list of dicts
+        """
         events = self._qmp.get_events(wait=wait)
         events.extend(self._events)
         del self._events[:]
@@ -353,7 +370,7 @@ class QEMUMachine(object):
         return events
 
     def event_wait(self, name, timeout=60.0, match=None):
-        '''
+        """
         Wait for specified timeout on named event in QMP; optionally filter
         results by match.
 
@@ -361,7 +378,7 @@ class QEMUMachine(object):
         branch processing on match's value None
            {"foo": {"bar": 1}} matches {"foo": None}
            {"foo": {"bar": 1}} does not matches {"foo": {"baz": None}}
-        '''
+        """
         def event_match(event, match=None):
             if match is None:
                 return True
@@ -394,29 +411,29 @@ class QEMUMachine(object):
         return None
 
     def get_log(self):
-        '''
+        """
         After self.shutdown or failed qemu execution, this returns the output
         of the qemu process.
-        '''
+        """
         return self._iolog
 
     def add_args(self, *args):
-        '''
+        """
         Adds to the list of extra arguments to be given to the QEMU binary
-        '''
+        """
         self._args.extend(args)
 
     def set_machine(self, machine_type):
-        '''
+        """
         Sets the machine type
 
         If set, the machine type will be added to the base arguments
         of the resulting QEMU command line.
-        '''
+        """
         self._machine = machine_type
 
     def set_console(self, device_type=None):
-        '''
+        """
         Sets the device type for a console device
 
         If set, the console device and a backing character device will
@@ -434,7 +451,7 @@ class QEMUMachine(object):
         @param device_type: the device type, such as "isa-serial"
         @raises: QEMUMachineAddDeviceError if the device type is not given
                  and can not be determined.
-        '''
+        """
         if device_type is None:
             if self._machine is None:
                 raise QEMUMachineAddDeviceError("Can not add a console device:"
-- 
2.17.1



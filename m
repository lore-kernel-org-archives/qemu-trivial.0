Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g9bSd-0006Jv-VG
	for mharc-qemu-trivial@gnu.org; Mon, 08 Oct 2018 15:44:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1g9bSX-0006GI-57
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2018 15:44:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1g9bST-0005pD-Gu
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2018 15:44:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58098)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1g9bS8-0005eD-1T; Mon, 08 Oct 2018 15:44:29 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B6925300177C;
	Mon,  8 Oct 2018 19:44:16 +0000 (UTC)
Received: from [10.18.17.221] (dhcp-17-221.bos.redhat.com [10.18.17.221])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDC9060F86;
	Mon,  8 Oct 2018 19:44:14 +0000 (UTC)
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-10-crosa@redhat.com>
From: John Snow <jsnow@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jsnow@redhat.com; prefer-encrypt=mutual; keydata=
	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
	NRhibLIrSP2g5nqXONyQrFxb1HtVaoR+Nrk=
Message-ID: <b590e7a3-c0e8-f39b-8a9b-b56d4804a6bc@redhat.com>
Date: Mon, 8 Oct 2018 15:44:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181004161852.11673-10-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Mon, 08 Oct 2018 19:44:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH 09/10] scripts/qemu.py: use
 a more consistent docstring style
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
X-List-Received-Date: Mon, 08 Oct 2018 19:44:58 -0000



On 10/04/2018 12:18 PM, Cleber Rosa wrote:
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  dtc             |  2 +-
>  scripts/qemu.py | 65 +++++++++++++++++++++++++++++++------------------
>  2 files changed, 42 insertions(+), 25 deletions(-)
> 
> diff --git a/dtc b/dtc
> index 88f18909db..e54388015a 160000
> --- a/dtc
> +++ b/dtc
> @@ -1 +1 @@
> -Subproject commit 88f18909db731a627456f26d779445f84e449536
> +Subproject commit e54388015af1fb4bf04d0bca99caba1074d9cc42
> diff --git a/scripts/qemu.py b/scripts/qemu.py
> index f099ce7278..7abe26de69 100644
> --- a/scripts/qemu.py
> +++ b/scripts/qemu.py
> @@ -53,9 +53,9 @@ class QEMUMachineAddDeviceError(QEMUMachineError):
>      """
>  
>  class MonitorResponseError(qmp.qmp.QMPError):
> -    '''
> +    """
>      Represents erroneous QMP monitor reply
> -    '''
> +    """

This seems obviously correct, as per the Python Dogma Handbook ...

>      def __init__(self, reply):
>          try:
>              desc = reply["error"]["desc"]
> @@ -66,14 +66,15 @@ class MonitorResponseError(qmp.qmp.QMPError):
>  
>  
>  class QEMUMachine(object):
> -    '''A QEMU VM
> +    """
> +    A QEMU VM
>  
>      Use this object as a context manager to ensure the QEMU process terminates::
>  
>          with VM(binary) as vm:
>              ...
>          # vm is guaranteed to be shut down here
> -    '''
> +    """

As does this,,

>  
>      def __init__(self, binary, args=None, wrapper=None, name=None,
>                   test_dir="/var/tmp", monitor_address=None,
> @@ -135,7 +136,9 @@ class QEMUMachine(object):
>          self._args.append(args)
>  
>      def add_fd(self, fd, fdset, opaque, opts=''):
> -        '''Pass a file descriptor to the VM'''
> +        """
> +        Pass a file descriptor to the VM
> +        """

However, is it established practice among ne'er-do-wells to format
one-line docstrings as three-liners? (And without punctuation to boot --
for shame!)

PEP257 suggests that one-liners are allowed, but doesn't seem to
necessitate their usage. Does this kind of change have any kind of benefit?

>          options = ['fd=%d' % fd,
>                     'set=%d' % fdset,
>                     'opaque=%s' % opaque]
> @@ -168,7 +171,9 @@ class QEMUMachine(object):
>  
>      @staticmethod
>      def _remove_if_exists(path):
> -        '''Remove file object at path if it exists'''
> +        """
> +        Remove file object at path if it exists
> +        """
>          try:
>              os.remove(path)
>          except OSError as exception:
> @@ -271,7 +276,9 @@ class QEMUMachine(object):
>              raise
>  
>      def _launch(self):
> -        '''Launch the VM and establish a QMP connection'''
> +        """
> +        Launch the VM and establish a QMP connection
> +        """
>          devnull = open(os.path.devnull, 'rb')
>          self._pre_launch()
>          self._qemu_full_args = (self._wrapper + [self._binary] +
> @@ -284,14 +291,18 @@ class QEMUMachine(object):
>          self._post_launch()
>  
>      def wait(self):
> -        '''Wait for the VM to power off'''
> +        """
> +        Wait for the VM to power off
> +        """
>          self._popen.wait()
>          self._qmp.close()
>          self._load_io_log()
>          self._post_shutdown()
>  
>      def shutdown(self):
> -        '''Terminate the VM and clean up'''
> +        """
> +        Terminate the VM and clean up
> +        """
>          if self.is_running():
>              try:
>                  self._qmp.cmd('quit')
> @@ -315,7 +326,9 @@ class QEMUMachine(object):
>          self._launched = False
>  
>      def qmp(self, cmd, conv_keys=True, **args):
> -        '''Invoke a QMP command and return the response dict'''
> +        """
> +        Invoke a QMP command and return the response dict
> +        """
>          qmp_args = dict()
>          for key, value in args.items():
>              if conv_keys:
> @@ -326,11 +339,11 @@ class QEMUMachine(object):
>          return self._qmp.cmd(cmd, args=qmp_args)
>  
>      def command(self, cmd, conv_keys=True, **args):
> -        '''
> +        """
>          Invoke a QMP command.
>          On success return the response dict.
>          On failure raise an exception.
> -        '''
> +        """
>          reply = self.qmp(cmd, conv_keys, **args)
>          if reply is None:
>              raise qmp.qmp.QMPError("Monitor is closed")
> @@ -339,13 +352,17 @@ class QEMUMachine(object):
>          return reply["return"]
>  
>      def get_qmp_event(self, wait=False):
> -        '''Poll for one queued QMP events and return it'''
> +        """
> +        Poll for one queued QMP events and return it
> +        """
>          if len(self._events) > 0:
>              return self._events.pop(0)
>          return self._qmp.pull_event(wait=wait)
>  
>      def get_qmp_events(self, wait=False):
> -        '''Poll for queued QMP events and return a list of dicts'''
> +        """
> +        Poll for queued QMP events and return a list of dicts
> +        """
>          events = self._qmp.get_events(wait=wait)
>          events.extend(self._events)
>          del self._events[:]
> @@ -353,7 +370,7 @@ class QEMUMachine(object):
>          return events
>  
>      def event_wait(self, name, timeout=60.0, match=None):
> -        '''
> +        """
>          Wait for specified timeout on named event in QMP; optionally filter
>          results by match.
>  
> @@ -361,7 +378,7 @@ class QEMUMachine(object):
>          branch processing on match's value None
>             {"foo": {"bar": 1}} matches {"foo": None}
>             {"foo": {"bar": 1}} does not matches {"foo": {"baz": None}}
> -        '''
> +        """
>          def event_match(event, match=None):
>              if match is None:
>                  return True
> @@ -394,29 +411,29 @@ class QEMUMachine(object):
>          return None
>  
>      def get_log(self):
> -        '''
> +        """
>          After self.shutdown or failed qemu execution, this returns the output
>          of the qemu process.
> -        '''
> +        """
>          return self._iolog
>  
>      def add_args(self, *args):
> -        '''
> +        """
>          Adds to the list of extra arguments to be given to the QEMU binary
> -        '''
> +        """
>          self._args.extend(args)
>  
>      def set_machine(self, machine_type):
> -        '''
> +        """
>          Sets the machine type
>  
>          If set, the machine type will be added to the base arguments
>          of the resulting QEMU command line.
> -        '''
> +        """
>          self._machine = machine_type
>  
>      def set_console(self, device_type=None):
> -        '''
> +        """
>          Sets the device type for a console device
>  
>          If set, the console device and a backing character device will
> @@ -434,7 +451,7 @@ class QEMUMachine(object):
>          @param device_type: the device type, such as "isa-serial"
>          @raises: QEMUMachineAddDeviceError if the device type is not given
>                   and can not be determined.
> -        '''
> +        """
>          if device_type is None:
>              if self._machine is None:
>                  raise QEMUMachineAddDeviceError("Can not add a console device:"
> 




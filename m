Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W6aIO-0006l6-Sp
	for mharc-qemu-trivial@gnu.org; Fri, 24 Jan 2014 01:31:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1W6aIG-0006XO-Q8
	for qemu-trivial@nongnu.org; Fri, 24 Jan 2014 01:31:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1W6aIA-0005oC-0A
	for qemu-trivial@nongnu.org; Fri, 24 Jan 2014 01:31:08 -0500
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80]:59145)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1W6aHs-0005Yt-AC; Fri, 24 Jan 2014 01:30:44 -0500
Received: from localhost (localhost [127.0.0.1])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id 5C9A3102439;
	Fri, 24 Jan 2014 07:30:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
	by localhost (smtp.mail.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 4E2TVYUxlpx8; Fri, 24 Jan 2014 07:30:39 +0100 (CET)
Received: from [192.168.178.35] (p54AD8374.dip0.t-ipconnect.de
	[84.173.131.116])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTPSA id 8DFFE1023A4;
	Fri, 24 Jan 2014 07:30:38 +0100 (CET)
Message-ID: <52E2088D.3030300@weilnetz.de>
Date: Fri, 24 Jan 2014 07:30:37 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Stewart Smith <stewart@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <1390452896-20146-1-git-send-email-stewart@linux.vnet.ibm.com>	<1390527551-22069-1-git-send-email-stewart@linux.vnet.ibm.com>
	<1390527551-22069-4-git-send-email-stewart@linux.vnet.ibm.com>
In-Reply-To: <1390527551-22069-4-git-send-email-stewart@linux.vnet.ibm.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 134.155.96.80
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 3/6] configure:
 alphabetize output of --help and separate into groups
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jan 2014 06:31:16 -0000

Am 24.01.2014 02:39, schrieb Stewart Smith:
> This should make it (slightly) easier to discover configure options.
> I've tried to separate out build options (e.g. gcov) from feature
> options (such as gtk).
> 
> Signed-off-by: Stewart Smith <stewart@linux.vnet.ibm.com>
> ---
>  configure | 174 ++++++++++++++++++++++++++++++++------------------------------
>  1 file changed, 89 insertions(+), 85 deletions(-)
> 
> diff --git a/configure b/configure
> index e61708a..c225291 100755
> --- a/configure
> +++ b/configure
> @@ -1102,7 +1102,7 @@ Standard options:
>  $(echo Available targets: $default_target_list | \
>    fold -s -w 53 | sed -e 's/^/                           /')
>  
> -Advanced options (experts only):
> +Advanced options, build (experts only):
>    --source-path=PATH       path of source code [$source_path]
>    --cross-prefix=PREFIX    use PREFIX for compile tools [$cross_prefix]
>    --cc=CC                  use C compiler CC [$cc]
> @@ -1135,16 +1135,18 @@ Advanced options (experts only):
>    --disable-sparse         disable sparse checker (default)
>    --disable-strip          disable stripping binaries
>    --disable-werror         disable compilation abort on warning
> -  --disable-sdl            disable SDL
> -  --enable-sdl             enable SDL
> -  --disable-gtk            disable gtk UI
> -  --enable-gtk             enable gtk UI
> -  --disable-virtfs         disable VirtFS
> -  --enable-virtfs          enable VirtFS
> -  --disable-vnc            disable VNC
> -  --enable-vnc             enable VNC
> -  --disable-cocoa          disable Cocoa (Mac OS X only)
> -  --enable-cocoa           enable Cocoa (default on Mac OS X)
> +  --disable-attr           disables attr and xattr support
> +  --enable-attr            enable attr and xattr support
> +  --enable-pie             build Position Independent Executables
> +  --disable-pie            do not build Position Independent Executables
> +  --cpu=CPU                Build for host CPU [$cpu]
> +  --disable-blobs          disable installing provided firmware blobs
> +  --enable-gcov            enable test coverage analysis with gcov
> +  --gcov=GCOV              use specified gcov [$gcov_tool]
> +  --enable-docs            enable documentation build
> +  --disable-docs           disable documentation build
> +
> +Advanced options, features (experts only):
>    --audio-drv-list=LIST    set audio drivers list:
>                             Available drivers: $audio_possible_drivers
>    --block-drv-whitelist=L  Same as --block-drv-rw-whitelist=L
> @@ -1154,105 +1156,107 @@ Advanced options (experts only):
>    --block-drv-ro-whitelist=L
>                             set block driver read-only whitelist
>                             (affects only QEMU, not qemu-img)
> -  --disable-xen            disable xen backend driver support
> -  --enable-xen             enable xen backend driver support
> -  --disable-xen-pci-passthrough
> -  --enable-xen-pci-passthrough
>    --disable-brlapi         disable BrlAPI
>    --enable-brlapi          enable BrlAPI
> -  --disable-vnc-tls        disable TLS encryption for VNC server
> -  --enable-vnc-tls         enable TLS encryption for VNC server
> -  --disable-vnc-sasl       disable SASL encryption for VNC server
> -  --enable-vnc-sasl        enable SASL encryption for VNC server
> -  --disable-vnc-jpeg       disable JPEG lossy compression for VNC server
> -  --enable-vnc-jpeg        enable JPEG lossy compression for VNC server
> -  --disable-vnc-png        disable PNG compression for VNC server (default)
> -  --enable-vnc-png         enable PNG compression for VNC server
> -  --disable-vnc-ws         disable Websockets support for VNC server
> -  --enable-vnc-ws          enable Websockets support for VNC server
> -  --disable-curses         disable curses output
> -  --enable-curses          enable curses output
> +  --disable-bluez          disable bluez stack connectivity
> +  --enable-bluez           enable bluez stack connectivity
> +  --disable-cap-ng         disable libcap-ng support
> +  --enable-cap-ng          enable libcap-ng support
> +  --disable-cocoa          disable Cocoa (Mac OS X only)
> +  --enable-cocoa           enable Cocoa (default on Mac OS X)
> +  --with-coroutine=BACKEND coroutine backend. Supported options:
> +                           gthread, ucontext, sigaltstack, windows
> +  --disable-coroutine-pool disable coroutine freelist (worse performance)
> +  --enable-coroutine-pool  enable coroutine freelist (better performance)
>    --disable-curl           disable curl connectivity
>    --enable-curl            enable curl connectivity
> +  --disable-curses         disable curses output
> +  --enable-curses          enable curses output
>    --disable-fdt            disable fdt device tree
>    --enable-fdt             enable fdt device tree
> -  --disable-bluez          disable bluez stack connectivity
> -  --enable-bluez           enable bluez stack connectivity
> -  --disable-slirp          disable SLIRP userspace network connectivity
> -  --disable-kvm            disable KVM acceleration support
> -  --enable-kvm             enable KVM acceleration support
> +  --fmod-lib               path to FMOD library
> +  --fmod-inc               path to FMOD includes
> +  --enable-glusterfs       enable GlusterFS backend
> +  --disable-glusterfs      disable GlusterFS backend
> +  --disable-gtk            disable gtk UI
> +  --enable-gtk             enable gtk UI
> +  --enable-guest-base      enable GUEST_BASE support for usermode
> +                           emulation targets
> +  --disable-guest-base     disable GUEST_BASE support
>    --disable-rdma           disable RDMA-based migration support
>    --enable-rdma            enable RDMA-based migration support
> -  --enable-tcg-interpreter enable TCG with bytecode interpreter (TCI)
> +  --disable-kvm            disable KVM acceleration support
> +  --enable-kvm             enable KVM acceleration support
> +  --disable-libiscsi       disable iscsi support
> +  --enable-libiscsi        enable iscsi support
> +  --disable-libssh2        disable ssh block device support
> +  --enable-libssh2         enable ssh block device support
> +  --disable-libusb         disable libusb (for usb passthrough)
> +  --enable-libusb          enable libusb (for usb passthrough)
> +  --disable-linux-aio      disable Linux AIO support
> +  --enable-linux-aio       enable Linux AIO support
> +  --disable-netmap         disable support for netmap network
> +  --enable-netmap          enable support for netmap network
> +  --enable-rbd             enable building the rados block device (rbd)
> +  --disable-sdl            disable SDL
> +  --enable-sdl             enable SDL
> +  --disable-seccomp        disable seccomp support
> +  --enable-seccomp         enables seccomp support
> +  --disable-slirp          disable SLIRP userspace network connectivity
> +  --disable-smartcard-nss  disable smartcard nss support
> +  --enable-smartcard-nss   enable smartcard nss support
> +  --disable-spice          disable spice
> +  --enable-spice           enable spice
>    --enable-system          enable all system emulation targets
>    --disable-system         disable all system emulation targets
> +  --enable-tcg-interpreter enable TCG with bytecode interpreter (TCI)
> +  --enable-tpm             enable TPM support
> +  --enable-trace-backend=B Set trace backend
> +                           Available backends: $($python $source_path/scripts/tracetool.py --list-backends)
> +  --with-trace-file=NAME   Full PATH,NAME of file to store traces
> +                           Default:trace-<pid>
>    --enable-user            enable supported user emulation targets
>    --disable-user           disable all user emulation targets
> -  --enable-linux-user      enable all linux usermode emulation targets
> -  --disable-linux-user     disable all linux usermode emulation targets
>    --enable-bsd-user        enable all BSD usermode emulation targets
>    --disable-bsd-user       disable all BSD usermode emulation targets
> -  --enable-guest-base      enable GUEST_BASE support for usermode
> -                           emulation targets
> -  --disable-guest-base     disable GUEST_BASE support
> -  --enable-pie             build Position Independent Executables
> -  --disable-pie            do not build Position Independent Executables
> -  --fmod-lib               path to FMOD library
> -  --fmod-inc               path to FMOD includes
> +  --enable-linux-user      enable all linux usermode emulation targets
> +  --disable-linux-user     disable all linux usermode emulation targets
>    --oss-lib                path to OSS library
>    --enable-uname-release=R Return R for uname -r in usermode emulation
> -  --cpu=CPU                Build for host CPU [$cpu]
> +  --disable-usb-redir      disable usb network redirection support
> +  --enable-usb-redir       enable usb network redirection support
>    --disable-uuid           disable uuid support
>    --enable-uuid            enable uuid support
>    --disable-vde            disable support for vde network
>    --enable-vde             enable support for vde network
> -  --disable-netmap         disable support for netmap network
> -  --enable-netmap          enable support for netmap network
> -  --disable-linux-aio      disable Linux AIO support
> -  --enable-linux-aio       enable Linux AIO support
> -  --disable-cap-ng         disable libcap-ng support
> -  --enable-cap-ng          enable libcap-ng support
> -  --disable-attr           disables attr and xattr support
> -  --enable-attr            enable attr and xattr support
> -  --disable-blobs          disable installing provided firmware blobs
> -  --enable-docs            enable documentation build
> -  --disable-docs           disable documentation build
> +  --disable-vhdx           disables support for the Microsoft VHDX image format
> +  --enable-vhdx            enable support for the Microsoft VHDX image format
>    --disable-vhost-net      disable vhost-net acceleration support
>    --enable-vhost-net       enable vhost-net acceleration support
> -  --enable-trace-backend=B Set trace backend
> -                           Available backends: $($python $source_path/scripts/tracetool.py --list-backends)
> -  --with-trace-file=NAME   Full PATH,NAME of file to store traces
> -                           Default:trace-<pid>
> -  --disable-spice          disable spice
> -  --enable-spice           enable spice
> -  --enable-rbd             enable building the rados block device (rbd)
> -  --disable-libiscsi       disable iscsi support
> -  --enable-libiscsi        enable iscsi support
> -  --disable-smartcard-nss  disable smartcard nss support
> -  --enable-smartcard-nss   enable smartcard nss support
> -  --disable-libusb         disable libusb (for usb passthrough)
> -  --enable-libusb          enable libusb (for usb passthrough)
> -  --disable-usb-redir      disable usb network redirection support
> -  --enable-usb-redir       enable usb network redirection support
> +  --disable-virtfs         disable VirtFS
> +  --enable-virtfs          enable VirtFS
> +  --disable-vnc            disable VNC
> +  --enable-vnc             enable VNC
> +  --disable-vnc-jpeg       disable JPEG lossy compression for VNC server
> +  --enable-vnc-jpeg        enable JPEG lossy compression for VNC server
> +  --disable-vnc-png        disable PNG compression for VNC server (default)
> +  --enable-vnc-png         enable PNG compression for VNC server
> +  --disable-vnc-sasl       disable SASL encryption for VNC server
> +  --enable-vnc-sasl        enable SASL encryption for VNC server
> +  --disable-vnc-tls        disable TLS encryption for VNC server
> +  --enable-vnc-tls         enable TLS encryption for VNC server
> +  --disable-vnc-ws         disable Websockets support for VNC server
> +  --enable-vnc-ws          enable Websockets support for VNC server
> +  --with-win-sdk=SDK-path  path to Windows Platform SDK (to build VSS .tlb)
> +  --disable-xen            disable xen backend driver support
> +  --enable-xen             enable xen backend driver support
> +  --disable-xen-pci-passthrough
> +  --enable-xen-pci-passthrough
> +
> +Advanced options, Guest Agent (experts only):
>    --disable-guest-agent    disable building of the QEMU Guest Agent
>    --enable-guest-agent     enable building of the QEMU Guest Agent
>    --with-vss-sdk=SDK-path  enable Windows VSS support in QEMU Guest Agent
> -  --with-win-sdk=SDK-path  path to Windows Platform SDK (to build VSS .tlb)
> -  --disable-seccomp        disable seccomp support
> -  --enable-seccomp         enables seccomp support
> -  --with-coroutine=BACKEND coroutine backend. Supported options:
> -                           gthread, ucontext, sigaltstack, windows
> -  --disable-coroutine-pool disable coroutine freelist (worse performance)
> -  --enable-coroutine-pool  enable coroutine freelist (better performance)
> -  --enable-glusterfs       enable GlusterFS backend
> -  --disable-glusterfs      disable GlusterFS backend
> -  --enable-gcov            enable test coverage analysis with gcov
> -  --gcov=GCOV              use specified gcov [$gcov_tool]
> -  --enable-tpm             enable TPM support
> -  --disable-libssh2        disable ssh block device support
> -  --enable-libssh2         enable ssh block device support
> -  --disable-vhdx           disables support for the Microsoft VHDX image format
> -  --enable-vhdx            enable support for the Microsoft VHDX image format
>  
>  NOTE: The object files are built at the place where configure is launched
>  EOF
> 


May I suggest a different first step to make the help output more readable?

Do we really need two lines of help output for each pair of --enable-xxx
and --disable-xxx? It would be sufficient to document only one variant
if the other variant is always supported, too. My favourite is a pattern
like this:

--disable-xxx        disable xxx support (default: enabled)
--disable-xxx        disable xxx support (default: auto detected)
--disable-xxx        disable xxx support (default)

A final hint could say "Instead of --disable-xxx you can also enforce a
feature with --enable-xxx".

I like alphabetized sorts but would keep groups like the different
selections for the gui interfaces. Those could be largely reduced if we
used libvnc. That would also fix bugs and reduce the efforts needed for
maintainance of QEMU, but that is a different topic :-)

Stefan



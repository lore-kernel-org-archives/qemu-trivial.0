Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a1Elm-0007uC-Hu
	for mharc-qemu-trivial@gnu.org; Tue, 24 Nov 2015 09:40:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a1Elf-0007is-6Z
	for qemu-trivial@nongnu.org; Tue, 24 Nov 2015 09:40:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a1Elb-0007PS-6Y
	for qemu-trivial@nongnu.org; Tue, 24 Nov 2015 09:40:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33743)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a1ElR-0007L9-GT; Tue, 24 Nov 2015 09:40:13 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 3739D689;
	Tue, 24 Nov 2015 14:40:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-47.ams2.redhat.com
	[10.36.116.47])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAOEeB74022502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 24 Nov 2015 09:40:12 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 04661303F16C; Tue, 24 Nov 2015 15:40:10 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
References: <1447936168-9808-1-git-send-email-armbru@redhat.com>
Date: Tue, 24 Nov 2015 15:40:10 +0100
In-Reply-To: <1447936168-9808-1-git-send-email-armbru@redhat.com> (Markus
	Armbruster's message of "Thu, 19 Nov 2015 13:29:28 +0100")
Message-ID: <871tbfxxyt.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] typedefs: Put them back
	into alphabetical order
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
X-List-Received-Date: Tue, 24 Nov 2015 14:40:33 -0000

Fat-fingered the cc.

Markus Armbruster <armbru@redhat.com> writes:

> "Please keep this list in alphabetical order" has been more honoured
> in the breach than in the observance.  Clean up.
>
> While there, drop a redundant struct declaration.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/qemu/typedefs.h | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
> index 6b1093d..3eedcf4 100644
> --- a/include/qemu/typedefs.h
> +++ b/include/qemu/typedefs.h
> @@ -3,7 +3,6 @@
>  
>  /* A load of opaque types so that device init declarations don't have to
>     pull in all the real definitions.  */
> -struct Monitor;
>  
>  /* Please keep this list in alphabetical order */
>  typedef struct AdapterInfo AdapterInfo;
> @@ -19,8 +18,8 @@ typedef struct BusState BusState;
>  typedef struct CharDriverState CharDriverState;
>  typedef struct CompatProperty CompatProperty;
>  typedef struct CPUAddressSpace CPUAddressSpace;
> -typedef struct DeviceState DeviceState;
>  typedef struct DeviceListener DeviceListener;
> +typedef struct DeviceState DeviceState;
>  typedef struct DisplayChangeListener DisplayChangeListener;
>  typedef struct DisplayState DisplayState;
>  typedef struct DisplaySurface DisplaySurface;
> @@ -46,6 +45,7 @@ typedef struct MigrationIncomingState MigrationIncomingState;
>  typedef struct MigrationParams MigrationParams;
>  typedef struct MigrationState MigrationState;
>  typedef struct Monitor Monitor;
> +typedef struct MonitorDef MonitorDef;
>  typedef struct MouseTransformInfo MouseTransformInfo;
>  typedef struct MSIMessage MSIMessage;
>  typedef struct NetClientState NetClientState;
> @@ -63,13 +63,13 @@ typedef struct PCIESlot PCIESlot;
>  typedef struct PCIExpressDevice PCIExpressDevice;
>  typedef struct PCIExpressHost PCIExpressHost;
>  typedef struct PCIHostState PCIHostState;
> -typedef struct PCMachineState PCMachineState;
>  typedef struct PCMachineClass PCMachineClass;
> +typedef struct PCMachineState PCMachineState;
>  typedef struct PCMCIACardState PCMCIACardState;
>  typedef struct PixelFormat PixelFormat;
>  typedef struct PostcopyDiscardState PostcopyDiscardState;
> -typedef struct PropertyInfo PropertyInfo;
>  typedef struct Property Property;
> +typedef struct PropertyInfo PropertyInfo;
>  typedef struct QEMUBH QEMUBH;
>  typedef struct QemuConsole QemuConsole;
>  typedef struct QEMUFile QEMUFile;
> @@ -78,10 +78,10 @@ typedef struct QemuOpts QemuOpts;
>  typedef struct QemuOptsList QemuOptsList;
>  typedef struct QEMUSGList QEMUSGList;
>  typedef struct QEMUSizedBuffer QEMUSizedBuffer;
> -typedef struct QEMUTimerListGroup QEMUTimerListGroup;
>  typedef struct QEMUTimer QEMUTimer;
> -typedef struct Range Range;
> +typedef struct QEMUTimerListGroup QEMUTimerListGroup;
>  typedef struct RAMBlock RAMBlock;
> +typedef struct Range Range;
>  typedef struct SerialState SerialState;
>  typedef struct SHPCDevice SHPCDevice;
>  typedef struct SMBusDevice SMBusDevice;
> @@ -89,6 +89,5 @@ typedef struct SSIBus SSIBus;
>  typedef struct uWireSlave uWireSlave;
>  typedef struct VirtIODevice VirtIODevice;
>  typedef struct Visitor Visitor;
> -typedef struct MonitorDef MonitorDef;
>  
>  #endif /* QEMU_TYPEDEFS_H */


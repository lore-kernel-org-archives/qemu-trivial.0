Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bUEsG-0000Es-I7
	for mharc-qemu-trivial@gnu.org; Mon, 01 Aug 2016 11:11:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1bUEsE-0000CM-BD
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2016 11:11:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1bUEsC-00047J-98
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2016 11:11:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52716)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1bUEs7-000466-9r; Mon, 01 Aug 2016 11:11:15 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DEEC020279;
	Mon,  1 Aug 2016 15:11:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u71FBC4G021787
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 1 Aug 2016 11:11:14 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 104B111386A2; Mon,  1 Aug 2016 17:11:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Colin Lord <clord@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, peter.maydell@linaro.org
References: <1469636506-1768-1-git-send-email-clord@redhat.com>
	<318fbc9d-333d-f756-7c13-8bf552d70c92@redhat.com>
Date: Mon, 01 Aug 2016 17:11:12 +0200
In-Reply-To: <318fbc9d-333d-f756-7c13-8bf552d70c92@redhat.com> (Paolo
	Bonzini's message of "Mon, 1 Aug 2016 11:02:24 +0200")
Message-ID: <877fc05xtb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 01 Aug 2016 15:11:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] help: Update help to
 reflect that GTK is the default
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
X-List-Received-Date: Mon, 01 Aug 2016 15:11:23 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 27/07/2016 18:21, Colin Lord wrote:
>> Updates the messages displayed in the help option to reflect that GTK is
>> the default display, not SDL.
>> ---
>>  qemu-options.hx | 16 ++++++++++++----
>>  1 file changed, 12 insertions(+), 4 deletions(-)
>> 
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 8e0d9a5..5bec1d3 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -967,7 +967,7 @@ DEF("nographic", 0, QEMU_OPTION_nographic,
>>  STEXI
>>  @item -nographic
>>  @findex -nographic
>> -Normally, QEMU uses SDL to display the VGA output. With this option,
>> +Normally, QEMU uses GTK to display the VGA output. With this option,
>
> IIRC SDL is the default if GTK is not enabled.  So perhaps "uses GTK or
> SDL"?
>
> Since you are at it, replace "the VGA output" with "output (such as
> graphics, console, and the QEMU monitor)"
>
>>  you can totally disable graphical output so that QEMU is a simple
>>  command line application. The emulated serial port is redirected on
>>  the console and muxed with the monitor (unless redirected elsewhere
>> @@ -977,12 +977,12 @@ the console and monitor.
>>  ETEXI
>>  
>>  DEF("curses", 0, QEMU_OPTION_curses,
>> -    "-curses         use a curses/ncurses interface instead of SDL\n",
>> +    "-curses         use a curses/ncurses interface instead of GTK\n",
>
> Remove "instead of GTK" altogether?
>
>>      QEMU_ARCH_ALL)
>>  STEXI
>>  @item -curses
>>  @findex -curses
>> -Normally, QEMU uses SDL to display the VGA output.  With this option,
>> +Normally, QEMU uses GTK to display the VGA output.  With this option,
>
> Same as above ("GTK or SDL").
>
>>  QEMU can display the VGA output when in text mode using a
>>  curses/ncurses interface.  Nothing is displayed in graphical mode.
>>  ETEXI
>> @@ -1034,6 +1034,14 @@ STEXI
>>  Enable SDL.
>>  ETEXI
>>  
>> +DEF("gtk", 0, QEMU_OPTION_gtk,
>> +    "-gtk            enable GTK (default)\n", QEMU_ARCH_ALL)
>> +STEXI
>> +@item -gtk
>> +@findex -gtk
>> +Enable GTK.
>> +ETEXI
>
> We try to avoid adding new "-foo" options.  All of them invariably end
> up requiring some sort of suboption, which is why we have "-display" now.
>
>>  DEF("spice", HAS_ARG, QEMU_OPTION_spice,
>>      "-spice [port=port][,tls-port=secured-port][,x509-dir=<dir>]\n"
>>      "       [,x509-key-file=<file>][,x509-key-password=<file>]\n"
>> @@ -1228,7 +1236,7 @@ DEF("vnc", HAS_ARG, QEMU_OPTION_vnc ,
>>  STEXI
>>  @item -vnc @var{display}[,@var{option}[,@var{option}[,...]]]
>>  @findex -vnc
>> -Normally, QEMU uses SDL to display the VGA output.  With this option,
>> +Normally, QEMU uses GTK to display the VGA output.  With this option,
>
> Same as above ("GTK or SDL").
>
> Thanks,
>
> Paolo
>
>>  you can have QEMU listen on VNC display @var{display} and redirect the VGA
>>  display over the VNC session.  It is very useful to enable the usb
>>  tablet device when using this option (option @option{-usbdevice

Please have a look at 

From: Robert Ho <robert.hu@intel.com>
Subject: [PATCH v2 1/1] Reorganize help output of '-display' option
Date: Tue, 26 Jul 2016 18:17:11 +0800
Message-Id: <1469528231-26206-1-git-send-email-robert.hu@intel.com>


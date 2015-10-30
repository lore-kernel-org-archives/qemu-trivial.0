Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZsAU1-0004sq-8Z
	for mharc-qemu-trivial@gnu.org; Fri, 30 Oct 2015 10:16:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZsATv-0004lQ-22
	for qemu-trivial@nongnu.org; Fri, 30 Oct 2015 10:16:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZsATt-0005OY-Uo
	for qemu-trivial@nongnu.org; Fri, 30 Oct 2015 10:16:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55083)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZsATk-0005JV-MO; Fri, 30 Oct 2015 10:16:28 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 08F9FC0B83E5;
	Fri, 30 Oct 2015 14:16:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-52.ams2.redhat.com
	[10.36.116.52])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9UEGQcw023412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 30 Oct 2015 10:16:27 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B126F303F916; Fri, 30 Oct 2015 15:16:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
References: <1446134122-32292-1-git-send-email-armbru@redhat.com>
	<1446203638.1144.28.camel@redhat.com>
Date: Fri, 30 Oct 2015 15:16:25 +0100
In-Reply-To: <1446203638.1144.28.camel@redhat.com> (Gerd Hoffmann's message of
	"Fri, 30 Oct 2015 12:13:58 +0100")
Message-ID: <871tccigqu.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 0/4] ui audio qxl usb:
	Use g_new() & friends where that makes obvious sense
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
X-List-Received-Date: Fri, 30 Oct 2015 14:16:44 -0000

Gerd Hoffmann <kraxel@redhat.com> writes:

> On Do, 2015-10-29 at 16:55 +0100, Markus Armbruster wrote:
>> v2:
>> * Trivially rebased
>> 
>> Markus Armbruster (4):
>>   ui: Use g_new() & friends where that makes obvious sense
>>   audio: Use g_new() & friends where that makes obvious sense
>>   qxl: Use g_new() & friends where that makes obvious sense
>>   usb: Use g_new() & friends where that makes obvious sense
>
> I'd prefer to drop the audio one because there still is the gsoc patch
> series pending which touches all this anyway.

I'm fine with delaying the audio part; running spatch again is easy
enough.  I'd appreciate a reminder when the audio subsystem is ready for
this work.

> Otherwise looks fine to me.
>
> Do you want me pick this up or send a pull request yourself?

I thought either you or -trivial.

> On case of the latter:
>
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

Thanks!


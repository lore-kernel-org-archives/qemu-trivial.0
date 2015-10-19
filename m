Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zo4aV-0000bS-Qy
	for mharc-qemu-trivial@gnu.org; Mon, 19 Oct 2015 03:10:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Zo4aT-0000Xv-4M
	for qemu-trivial@nongnu.org; Mon, 19 Oct 2015 03:10:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Zo4aS-0007Vi-8Z
	for qemu-trivial@nongnu.org; Mon, 19 Oct 2015 03:10:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43233)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Zo4aO-0007V6-6f; Mon, 19 Oct 2015 03:10:24 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 5DB3F90930;
	Mon, 19 Oct 2015 07:10:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-25.ams2.redhat.com
	[10.36.116.25])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9J7AIdv027695
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 19 Oct 2015 03:10:20 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 16331303F90B; Mon, 19 Oct 2015 09:10:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <1444899255-16300-1-git-send-email-thuth@redhat.com>
	<5623A4C9.90102@ilande.co.uk>
Date: Mon, 19 Oct 2015 09:10:17 +0200
In-Reply-To: <5623A4C9.90102@ilande.co.uk> (Mark Cave-Ayland's message of
	"Sun, 18 Oct 2015 14:55:21 +0100")
Message-ID: <876123z63q.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com,
	Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/display/tcx: Remove
	superfluous OBJECT() typecasts
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
X-List-Received-Date: Mon, 19 Oct 2015 07:10:29 -0000

Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:

> On 15/10/15 09:54, Thomas Huth wrote:
>
>> The tcx_initfn() function is already supplied with an
>> Object *obj pointer, so there is no need to cast the
>> state pointer back to an Object pointer all over the
>> place. And while we're at it, also remove the superfluous
>> "return;" statement in this function.
>> 
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
[...]
> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>
> Note that I'm in the process of moving and therefore connectivity is
> going to be poor for the next week and a bit - happy for this to go via
> -trivial if that works for everyone?

Sure!


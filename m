Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QHdqg-0001uS-Qq
	for mharc-qemu-trivial@gnu.org; Wed, 04 May 2011 11:18:46 -0400
Received: from eggs.gnu.org ([140.186.70.92]:53100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QHdqa-0001iH-Vv
	for qemu-trivial@nongnu.org; Wed, 04 May 2011 11:18:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QHdqa-0002pD-8w
	for qemu-trivial@nongnu.org; Wed, 04 May 2011 11:18:40 -0400
Received: from mail-qy0-f180.google.com ([209.85.216.180]:59405)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QHdqU-0002no-1L; Wed, 04 May 2011 11:18:34 -0400
Received: by qyk10 with SMTP id 10so949106qyk.4
	for <multiple recipients>; Wed, 04 May 2011 08:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=ttQxnODCXu2FehO3bh4s2jN/7gE41BKOai4UmYIHkg4=;
	b=XXUUeEgHjs0Q/ExrkNWU26wxdMdR4w0OvoEnkcC9Fm51jPozMnYIjiV5V8fCOoj618
	ZAt/JUeKbWajsuECKfaCVahLeZVpY09hj6UTTfkgsPz830ZVkvQAfiHtAIFguggYc8M3
	szmI66mUHdGUSCXLem0HT7oi3qyri/yjrlUIo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=g6pLa8UTpMzU7Qq4IMkbnOBJflSGu8kop1GzpmnPqMXPeymBPvHqyKbUAfaJjVD9M5
	pGLXdfqRGEV04t1vIuMEcIGwaPJz6+e0SiAdLK6kjQvewnu9JWx1+uKyrMDi9uEUdt6U
	pMKul2bBZY4PY6O0rcV33dyZ3UYGFwRjiHTO4=
MIME-Version: 1.0
Received: by 10.52.91.20 with SMTP id ca20mr1530221vdb.99.1304522313008; Wed,
	04 May 2011 08:18:33 -0700 (PDT)
Received: by 10.220.200.7 with HTTP; Wed, 4 May 2011 08:18:32 -0700 (PDT)
In-Reply-To: <4DC064D5.7000800@mail.berlios.de>
References: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
	<4DC064D5.7000800@mail.berlios.de>
Date: Wed, 4 May 2011 16:18:32 +0100
Message-ID: <BANLkTimjGpNJ9sPgEFj8cRePRvx++V2UqA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.180
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 01/18] Fix typos in comments (dependancy
	-> dependency)
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
X-List-Received-Date: Wed, 04 May 2011 15:18:45 -0000

On Tue, May 3, 2011 at 9:25 PM, Stefan Weil <weil@mail.berlios.de> wrote:
> Am 28.04.2011 17:20, schrieb Stefan Weil:
>>
>> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
>> ---
>> Changelog | 2 +-
>> Makefile.objs | 2 +-
>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>
>
> There were no replies to the patch series up to now.

Sorry, I have been away on holiday and am still catching back up.
Let's take them as they are.

Stefan


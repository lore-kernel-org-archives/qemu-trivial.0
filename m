Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPXY0-0000YP-52
	for mharc-qemu-trivial@gnu.org; Mon, 17 Mar 2014 09:25:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WPXXt-0000Wq-7C
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 09:25:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WPXXm-0002l2-Cj
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 09:25:37 -0400
Received: from mail-wg0-f46.google.com ([74.125.82.46]:63305)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WPXXm-0002ki-3p
	for qemu-trivial@nongnu.org; Mon, 17 Mar 2014 09:25:30 -0400
Received: by mail-wg0-f46.google.com with SMTP id b13so4635576wgh.5
	for <qemu-trivial@nongnu.org>; Mon, 17 Mar 2014 06:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=UNVeiPj1aH6KieAzPoEhs7hQNxiL/ei71LXyQ3h/wTQ=;
	b=DgkyM1DQAiON/2RZ6c2wij9Lzz0a4S661X0PdF/cZjuhDF28pIfS1T0pO+3qvXoRoO
	diXHfEk6FHb8FLy9o1ThaNEt4DTx55/oYMM2XjuUo4I3k0U7pZG8+vC54dH/IgysqMTK
	qRC5Tp5yAWtxVd/HOVUZXJsuvP+O7uHnUKHobm7mR1BLoVKFC7wnY/1Tc/5Pi7FrEDXA
	zEliiZqS8ozybwQLksk1ihx1txQkUafUIsLMf08X3ExIANWYePBkdbs3qDSbKBJyxSv9
	j1+0qa0EXziOMNDTH+pUdHwcdjI59xZTmflKqUZrtKcw0jMZIe0YQIq7ImCXilw2XQ33
	nzpQ==
X-Gm-Message-State: ALoCoQme0Vk5Jbn9J/4NSOsMZGHbBZ2wDL+ljuJU4ObxpWG4yTBw9klJB+JSaZ6CA8GEqYM6RHaG
MIME-Version: 1.0
X-Received: by 10.194.82.69 with SMTP id g5mr82873wjy.85.1395062729359; Mon,
	17 Mar 2014 06:25:29 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.227.128.131 with HTTP; Mon, 17 Mar 2014 06:25:29 -0700 (PDT)
In-Reply-To: <1395004259-12551-1-git-send-email-maria.k@catit.be>
References: <1395004259-12551-1-git-send-email-maria.k@catit.be>
Date: Mon, 17 Mar 2014 23:25:29 +1000
X-Google-Sender-Auth: nM321Cd2400AsZG47xKXsuJTZ2Y
Message-ID: <CAEgOgz5F9V-b3fAFPBA5_A5k3qse0B5gX5J_8OfSvXv5QLZ4NA@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Maria Kustova <maxa@catit.be>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.46
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Maria Kustova <maria.k@catit.be>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/3] Trivial patches
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
X-List-Received-Date: Mon, 17 Mar 2014 13:25:42 -0000

Hi Maria,

Thanks for the patches. We have a trivial patches lists mailing lists
(that you cc in addition to qemu-devel) that is intended for this kind
of stuff.

CCd.

Regards,
Peter

On Mon, Mar 17, 2014 at 7:10 AM, Maria Kustova <maxa@catit.be> wrote:
> These patches are the part of OPW application.
> Two of them update help messages of qemu-io utility.
> And last one replaces fprintf() with error_setg() in curl.c
>
> Maria Kustova (3):
>   qemu-io-cmds: Fixed typo in example for writev.
>   block: Replaced old error handling with error reporting API.
>   qemu-io: Extended "--cmd" description in usage text
>
>  block/curl.c   | 2 +-
>  qemu-io-cmds.c | 2 +-
>  qemu-io.c      | 9 ++++++---
>  3 files changed, 8 insertions(+), 5 deletions(-)
>
> --
> 1.8.2.1
>
>


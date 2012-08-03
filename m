Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SxEX8-0005XW-9o
	for mharc-qemu-trivial@gnu.org; Fri, 03 Aug 2012 05:51:02 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SxEX1-0005Cr-Fv
	for qemu-trivial@nongnu.org; Fri, 03 Aug 2012 05:50:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SxEWx-00052A-A5
	for qemu-trivial@nongnu.org; Fri, 03 Aug 2012 05:50:55 -0400
Received: from mail-lpp01m010-f45.google.com ([209.85.215.45]:35830)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SxEWm-000504-4V; Fri, 03 Aug 2012 05:50:40 -0400
Received: by lahc1 with SMTP id c1so242464lah.4
	for <multiple recipients>; Fri, 03 Aug 2012 02:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=aLniC0y/nRcmNc0PzA1Kkw/B2/DA7jTrn4N4SZMpuMQ=;
	b=WMu661lSGbISB5YMDFHpvwU0jvTnbr0C/LliU/QEo34BvvecKHgR4EeogzN74AGykP
	r0a7iKAFUeJ5uzrfEHrvt116qZnb+6ddWbkPPJ9gtSsTb3L75UOWA24uy3c4drlhUSKe
	6Xdx0LuV+cV3gGLnYlNfQbaj0N6Riscq06cycPMTWmgiZJ1WG3h+aTP5qsa05Xbfu4nD
	SzCj8vHK+ZEGkvmv3iNZKpihtd0UuUlLfjIjN3FPM5QIv2uUXPbcRwHzFIYqtLxfBxdt
	nkzFb7NuhE5ighizuOW9eb7MPOhm7ZIpR461m9N9o4zZ/6u9Fnd/1GFX4VhhUOL7YHeh
	82zQ==
MIME-Version: 1.0
Received: by 10.112.43.67 with SMTP id u3mr455327lbl.16.1343987438806; Fri, 03
	Aug 2012 02:50:38 -0700 (PDT)
Received: by 10.112.71.73 with HTTP; Fri, 3 Aug 2012 02:50:38 -0700 (PDT)
In-Reply-To: <1343963182-28297-1-git-send-email-akong@redhat.com>
References: <1343963182-28297-1-git-send-email-akong@redhat.com>
Date: Fri, 3 Aug 2012 10:50:38 +0100
Message-ID: <CAJSP0QWLB0QF6CLEm84Ns3TCM0CbGF59sCRuOu2AebAaLhu+6Q@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Amos Kong <akong@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.45
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, qemu-devel@nongnu.org,
	quintela@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2 0/2] trivial fix of qemu-sockets.c
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
X-List-Received-Date: Fri, 03 Aug 2012 09:51:00 -0000

On Fri, Aug 3, 2012 at 4:06 AM, Amos Kong <akong@redhat.com> wrote:
> Those patches fix trivial issues which were found
> in the second review.
>
> Amos Kong (2):
>   remove unused include of error.h
>   socket: clean up redundant assignment
>
>  qemu-sockets.c |    1 -
>  qemu_socket.h  |    1 -
>  2 files changed, 0 insertions(+), 2 deletions(-)
>
> Changes from v1:
> - drop wrong patch: [PATCH] socket: remove redundant check

Thanks, merged.  I will update the pending trivial-patches pull
request to include these patches.

https://github.com/stefanha/qemu/commits/trivial-patches

Stefan


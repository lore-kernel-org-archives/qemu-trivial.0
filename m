Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bIiNv-0007YO-IG
	for mharc-qemu-trivial@gnu.org; Thu, 30 Jun 2016 16:16:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bIiNq-0007S9-Ez
	for qemu-trivial@nongnu.org; Thu, 30 Jun 2016 16:16:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bIiNl-0007aq-FZ
	for qemu-trivial@nongnu.org; Thu, 30 Jun 2016 16:16:21 -0400
Received: from mx4-phx2.redhat.com ([209.132.183.25]:48174)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bIiNl-0007al-6B; Thu, 30 Jun 2016 16:16:17 -0400
Received: from zmail13.collab.prod.int.phx2.redhat.com
	(zmail13.collab.prod.int.phx2.redhat.com [10.5.83.15])
	by mx4-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id u5UKGFkF020481;
	Thu, 30 Jun 2016 16:16:15 -0400
Date: Thu, 30 Jun 2016 16:16:15 -0400 (EDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <1670710013.3312910.1467317775489.JavaMail.zimbra@redhat.com>
In-Reply-To: <39d39e44-7590-857c-e487-eea148b4b5a3@redhat.com>
References: <1467315396-3628-1-git-send-email-jsnow@redhat.com>
	<CAFEAcA-mbSO_3OcUma98qFsnsc-tPtOot0GizFNq6+5sSPyftw@mail.gmail.com>
	<39d39e44-7590-857c-e487-eea148b4b5a3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.4.164.1, 10.5.101.130]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF47 (Linux)/8.0.6_GA_5922)
Thread-Topic: Remove left shifts of negative signed integers
Thread-Index: r/zN0BO0VpS8iW8NOThe46ymcLwimw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 209.132.183.25
Subject: Re: [Qemu-trivial] [PATCH] Remove left shifts of negative signed
 integers
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
X-List-Received-Date: Thu, 30 Jun 2016 20:16:23 -0000

> > We have been down this path before:
> > http://patchwork.ozlabs.org/patch/545238/
> > 
> > Paolo will doubtless be along with the rant shortly.

Here I am!

Paolo

> I figured, so I CC'd him. Nobody can say I didn't try.
> 
> --js
> 


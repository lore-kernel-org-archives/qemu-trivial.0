Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V1z1N-0004av-L2
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jul 2013 09:22:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1V1z1F-0004MS-Nw
	for qemu-trivial@nongnu.org; Wed, 24 Jul 2013 09:22:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1V1z1D-00041G-6D
	for qemu-trivial@nongnu.org; Wed, 24 Jul 2013 09:22:17 -0400
Received: from mail-qe0-x22d.google.com ([2607:f8b0:400d:c02::22d]:35260)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>)
	id 1V1z16-0003zp-JX; Wed, 24 Jul 2013 09:22:08 -0400
Received: by mail-qe0-f45.google.com with SMTP id w7so5320971qeb.4
	for <multiple recipients>; Wed, 24 Jul 2013 06:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=8+y6BcD3hP2P0wWnQhKgCY6NCp4V6CWMx8RoVrHS7Ow=;
	b=tePsAPw+3zTixUN5wMCdck72x7RslNV56OcGypw0TPTWyUHJKn3nwTIUoqehUrFDV6
	rpGbNlRFM9Xf6vNNuRcUehxsW40CpoZJDriDP9lIET1pSQ4AWuprW9wpjzJZk2G3VdbO
	triob8+B5zB96iFbYnmVajKpwPLWJstBCfW4hTsavlz6G/6SoErpEyv9tbQr2Hlw9GMs
	om6XX99uyg8zNmL9T+qdI5KU5BwVvfTFA1VrmnjUSDzl1BwsLzOMY3Q0t/5TyHSYhaQr
	/GZpADGqTkEM6Gi1WO6zFQ0OlR1tx2O0o3p1iq5pCDtdVxVgUzwFbQbAigBlJGnBUGx/
	MEDg==
MIME-Version: 1.0
X-Received: by 10.224.180.133 with SMTP id bu5mr43958059qab.50.1374672127372; 
	Wed, 24 Jul 2013 06:22:07 -0700 (PDT)
Sender: carpeddiem@gmail.com
Received: by 10.224.209.6 with HTTP; Wed, 24 Jul 2013 06:22:07 -0700 (PDT)
In-Reply-To: <1374225073-12959-3-git-send-email-mjt@msgid.tls.msk.ru>
References: <1374225073-12959-1-git-send-email-mjt@msgid.tls.msk.ru>
	<1374225073-12959-3-git-send-email-mjt@msgid.tls.msk.ru>
Date: Wed, 24 Jul 2013 09:22:07 -0400
X-Google-Sender-Auth: xSubl8CHGaDdzEW8k9hIeYD7wZM
Message-ID: <CAPyFy2DW_ca4PK5Y4-P4e4uh34B6VO_XduWOMwEoeqc4TYRoNA@mail.gmail.com>
From: Ed Maste <emaste@freebsd.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c02::22d
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PULL trivial 2/5] slirp: remove mbuf(m_hdr,
 m_dat) indirection
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
X-List-Received-Date: Wed, 24 Jul 2013 13:22:23 -0000

On 19 July 2013 05:11, Michael Tokarev <mjt@tls.msk.ru> wrote:
> ---
>  slirp/mbuf.h     |   51 ++++++++++++++++++---------------------------------
>  slirp/tcp_subr.c |   12 ++++++------
>  2 files changed, 24 insertions(+), 39 deletions(-)

Tested-by: Ed Maste <emaste@freebsd.org>


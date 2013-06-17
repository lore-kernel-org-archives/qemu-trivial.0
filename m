Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UoYwc-0003rD-5d
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jun 2013 08:54:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UoYwV-0003qE-19
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 08:54:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UoYwQ-00033E-I5
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 08:53:54 -0400
Received: from mail-we0-x234.google.com ([2a00:1450:400c:c03::234]:55222)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UoYwQ-000332-Bl; Mon, 17 Jun 2013 08:53:50 -0400
Received: by mail-we0-f180.google.com with SMTP id w56so2344229wes.11
	for <multiple recipients>; Mon, 17 Jun 2013 05:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3racs4FEJYBx7nm1hCOf9I5IbPuvC159ZJ8G0FMEkro=;
	b=UepF6YYQXIcoGyH6TM13t2jDOKB2K0QG0xqjRoeDH4jaXvsV+B/0MIPbIcwTeG004r
	8cbx81/l9SGJx+8ij3Ni89toua0gRUPno68YpIe+v3TKck1vucSDDnYIgxoW74I58hl7
	0OtUEK62azGBj5azNZDBbTC0MDnrxjSKHBh07PDUAmjl1kDdEe1wbYozblXxDFgm8tll
	wNppEOZZ8RNfrKsf6mDNJsXYH2uoBeYuT8vGKvoPCArlvm+ptk0gJ76Ve7NzkI13gtmo
	pPFIOyiQKtbqi73KxeGYtyv0qTjaD5nl1a8Hp1OVOdI279l0tKBETONj07tYGyEjkwSz
	jnmw==
X-Received: by 10.181.12.11 with SMTP id em11mr4785852wid.61.1371473629117;
	Mon, 17 Jun 2013 05:53:49 -0700 (PDT)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPSA id i1sm10653332wiz.6.2013.06.17.05.53.47
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 17 Jun 2013 05:53:48 -0700 (PDT)
Date: Mon, 17 Jun 2013 14:53:46 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130617125346.GF30145@stefanha-thinkpad.redhat.com>
References: <1371394865-19485-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1371394865-19485-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::234
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-img: Add missing
	GCC_FMT_ATTR
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
X-List-Received-Date: Mon, 17 Jun 2013 12:54:00 -0000

On Sun, Jun 16, 2013 at 05:01:05PM +0200, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  qemu-img.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>


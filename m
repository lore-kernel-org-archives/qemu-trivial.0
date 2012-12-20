Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TlbnS-0001aw-HG
	for mharc-qemu-trivial@gnu.org; Thu, 20 Dec 2012 03:48:06 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TlbnN-0001Mu-GM
	for qemu-trivial@nongnu.org; Thu, 20 Dec 2012 03:48:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TlbnK-0007Q3-9z
	for qemu-trivial@nongnu.org; Thu, 20 Dec 2012 03:48:01 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:49391)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1TlbnK-0007Pq-0Y
	for qemu-trivial@nongnu.org; Thu, 20 Dec 2012 03:47:58 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 62630A29;
	Thu, 20 Dec 2012 16:47:56 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to:content-transfer-encoding; s=rsa1024;
	bh=cW0JEXRbl1MznA39SQipafztRfE=; b=omEdXavfAl88Syfkwyobr1Z4ZTbz
	PPWOAp3hpfUlHVzJUXrwmSAvcD2k9nKRr1JDjxDt222TI9Bfuu8lXSgCYJSVBLYj
	H95vRBktMb9r7LeqzVkatCJNvZoCkoKzInFpyw82iqj/9fbKFGtD7ehqWz3UltNq
	kJfRyctumYNSkb8=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id 4FC56A28;
	Thu, 20 Dec 2012 16:47:56 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.5/8.14.5/Submit) id qBK8lrCN022408;
	Thu, 20 Dec 2012 16:47:53 +0800 (CST) (envelope-from chenwj)
Date: Thu, 20 Dec 2012 16:47:53 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20121220084752.GA22214@cs.nctu.edu.tw>
References: <20121210135131.GA40753@cs.nctu.edu.tw>
	<20121218162833.GF12099@stefanha-thinkpad.redhat.com>
	<CAJSP0QUJYWu44CAsZTU3NMZD0Bn311xXFt6HyuPx=H90GcXaug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJSP0QUJYWu44CAsZTU3NMZD0Bn311xXFt6HyuPx=H90GcXaug@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: FreeBSD 8.x
X-Received-From: 140.113.235.130
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Andreas Faerber <afaerber@suse.de>,
	=?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] Remove Sparc v7 and v8 host support from
 the configure list
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
X-List-Received-Date: Thu, 20 Dec 2012 08:48:05 -0000

On Thu, Dec 20, 2012 at 09:44:27AM +0100, Stefan Hajnoczi wrote:
> Wei-Ren: your SMTP server bounced my response, I hope it gets through n=
ow:
>=20
> 554 <chenwj@iis.sinica.edu.tw>...5.7.1 go away! you're rejected by reci=
pient.

  Seems works now? I got your mail this time.

--=20
Wei-Ren Chen (=E9=99=B3=E9=9F=8B=E4=BB=BB)
Computer Systems Lab, Institute of Information Science,
Academia Sinica, Taiwan (R.O.C.)
Tel:886-2-2788-3799 #1667
Homepage: http://people.cs.nctu.edu.tw/~chenwj


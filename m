Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNiJU-00005Y-JI
	for mharc-qemu-trivial@gnu.org; Tue, 08 Nov 2011 04:49:52 -0500
Received: from eggs.gnu.org ([140.186.70.92]:50095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RNiJS-0008S4-QD
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 04:49:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RNiJR-00006m-8Q
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 04:49:50 -0500
Received: from csmailer.cs.nctu.edu.tw ([140.113.235.130]:52491)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chenwj@cs.nctu.edu.tw>) id 1RNiJQ-00006D-Ki
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 04:49:49 -0500
Received: from csmailer.cs.nctu.edu.tw (localhost [127.0.0.1])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id CA708B6E;
	Tue,  8 Nov 2011 17:47:56 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cs.nctu.edu.tw; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to:content-transfer-encoding; s=rsa1024;
	bh=53DL/4452prERSIiCA8nD/QbqpA=; b=Ptmn+OFhOfjXSh0mYl3PVfVDPzSe
	/ZYPvwXZnFAqIcNHgKgKsdpXQyDWFfUeqEQ/Gm3sBAdlYGHV5IA3L1fIpoV70hv/
	IVDyAED8hIVmNzIIASXR5ffu+jKR4Dr9rzA7w/Bg5NJQqP/mfFgz4Tp70/unqMev
	j73/dhIPpGjqMbc=
Received: from alumni.cs.nctu.edu.tw (alumni.cs.nctu.edu.tw [140.113.235.116])
	by csmailer.cs.nctu.edu.tw (Postfix) with ESMTP id C3586B6D;
	Tue,  8 Nov 2011 17:47:56 +0800 (CST)
Received: (from chenwj@localhost)
	by alumni.cs.nctu.edu.tw (8.14.4/8.14.4/Submit) id pA89nj2S047432;
	Tue, 8 Nov 2011 17:49:45 +0800 (CST) (envelope-from chenwj)
Date: Tue, 8 Nov 2011 17:49:45 +0800
From: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20111108094945.GA47016@cs.nctu.edu.tw>
References: <1320481099-39231-1-git-send-email-chenwj@iis.sinica.edu.tw>
	<20111107082538.GF9450@stefanha-thinkpad.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20111107082538.GF9450@stefanha-thinkpad.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.113.235.130
Cc: qemu-trivial@nongnu.org, Chen Wen-Ren <chenwj@iis.sinica.edu.tw>
Subject: Re: [Qemu-trivial] [PATCH 2/2] linux-user/main.c: Add option to
 user-mode emulation so that user can specify log file name
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
X-List-Received-Date: Tue, 08 Nov 2011 09:49:52 -0000

> linux-user/main.c already uses cpu_set_log_filename(log_file).  It
> should not be necessary to make exec.c:logfilename global.
>=20
> Take a look at how bsd-user/main.c does what you're trying to do.
>=20
> Please send the patch through the linux-user maintainer, Riku Voipio
> <riku.voipio@iki.fi>, since this adds a user-visible command-line
> option.

  Thanks for the advice. I have re-sent the patch to qemu-trivial and
cc'ed to Riku.

Regards,
chenwj

--=20
Wei-Ren Chen (=E9=99=B3=E9=9F=8B=E4=BB=BB)
Computer Systems Lab, Institute of Information Science,
Academia Sinica, Taiwan (R.O.C.)
Tel:886-2-2788-3799 #1667


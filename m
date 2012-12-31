Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tpjqz-0004i5-5m
	for mharc-qemu-trivial@gnu.org; Mon, 31 Dec 2012 13:12:49 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1Tpjqt-0004hg-HO
	for qemu-trivial@nongnu.org; Mon, 31 Dec 2012 13:12:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1Tpjqr-00057h-2W
	for qemu-trivial@nongnu.org; Mon, 31 Dec 2012 13:12:43 -0500
Received: from mail-ie0-f175.google.com ([209.85.223.175]:64596)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1Tpjqq-00057b-U8; Mon, 31 Dec 2012 13:12:40 -0500
Received: by mail-ie0-f175.google.com with SMTP id qd14so15365150ieb.34
	for <multiple recipients>; Mon, 31 Dec 2012 10:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=evE3uuASOj9oJ6eriqXcr/cddDwNezC1uAN4JUyccQw=;
	b=HeXqNHKuDnVI2Tm704Xcrx6aML/JhnaJka/otEfuJE6uOv8xaxfyb9h/3ejvhpyHwF
	L/e3i9x7hLYy42TS5gQw9WFcBldaPNBsPv27uulilE3sYC9LB91nbil1ELzU+ui7SmU8
	08Nj1YG+6VR9nm1MHu4TKunkmo9ilaKUMSJPI6cD0cQJ7Vn8tqELOkVda/kfsF3GNLXl
	OGvHAPBL8OdGpP2iAlhDk6SU+jrE6JbcDBd/6ZXUPyoyrEaGMOeC003GwQaOw9tFzEAg
	zP6AF6XfNrzQTTfU/WwM2pvP5WLtf/etvXPOTF//V/ql/w6Ce/pDyZdQDKovsCs3c3z3
	nC8g==
X-Received: by 10.50.196.227 with SMTP id ip3mr31057828igc.97.1356977560523;
	Mon, 31 Dec 2012 10:12:40 -0800 (PST)
Received: from pebble.twiddle.home
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by mx.google.com with ESMTPS id v12sm33939798igv.3.2012.12.31.10.12.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Dec 2012 10:12:40 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <50E1D599.5090802@twiddle.net>
Date: Mon, 31 Dec 2012 10:12:41 -0800
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1356852013-12955-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1356852013-12955-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.223.175
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tcg: Remove unneeded
	assertion
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
X-List-Received-Date: Mon, 31 Dec 2012 18:12:47 -0000

On 2012-12-29 23:20, Stefan Weil wrote:
> Commit 7f6f0ae5b95adfa76e10eabe2c34424a955fd10c added two assertions.
> 
> One of these assertions is not needed:
> The pointer ts is never NULL because it is initialized with the
> address of an array element.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Richard Henderson <rth@twiddle.net>

r~


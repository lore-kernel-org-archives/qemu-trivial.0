Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQPYp-0007M7-NC
	for mharc-qemu-trivial@gnu.org; Sat, 28 May 2011 15:52:35 -0400
Received: from eggs.gnu.org ([140.186.70.92]:41944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QQPYn-0007Fb-6G
	for qemu-trivial@nongnu.org; Sat, 28 May 2011 15:52:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QQPYm-0004x6-D8
	for qemu-trivial@nongnu.org; Sat, 28 May 2011 15:52:33 -0400
Received: from mail-yx0-f173.google.com ([209.85.213.173]:44200)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QQPYk-0004wj-Ky; Sat, 28 May 2011 15:52:30 -0400
Received: by yxk8 with SMTP id 8so1319197yxk.4
	for <multiple recipients>; Sat, 28 May 2011 12:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=OuHqhSDMZTA3EHZ8XoCIXSdzIYMaVbsUyFqhvayR2rQ=;
	b=h9rjQUhQA69TXYTeJrvFItmv5PaHed2w04IiOkih+miya7rl8piDIunpgz+t1yVyE9
	s1qDimWFQHoBQJ0M9O1O7eZikd5WkY5yvRwqLVjoAolZhiXV41uWbBVt3l/uttlLwDSA
	eGcQMAo2pqyBeQp6DqJWn0rLuQv0e0iD7jEgo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=F/mM3bZYtoly0Wz7yW7fk3RTHgqN96dFofmmlbCGmTxJurbbrkqXA/BS+mwyRlwEop
	eSsmekEO6YD2nNi+pX0FouMiDFGOWGpcfsnbaIHKuHHBoDFV/ERw4OHODZY2J26tfO2w
	BIotHxpBX5soYMjJStp4GmxwOfgvRwnQObkRc=
MIME-Version: 1.0
Received: by 10.150.56.38 with SMTP id e38mr3032556yba.113.1306612349802; Sat,
	28 May 2011 12:52:29 -0700 (PDT)
Received: by 10.146.86.2 with HTTP; Sat, 28 May 2011 12:52:29 -0700 (PDT)
In-Reply-To: <yf9sjryq3gn.fsf@chiyo.mc.pp.se>
References: <yf9sjryq3gn.fsf@chiyo.mc.pp.se>
Date: Sat, 28 May 2011 20:52:29 +0100
Message-ID: <BANLkTinbdHYTdPgmZHwUBOb4xEmA=mjHnQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Andrzej Zaborowski <balrog@zabor.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Marcus Comstedt <marcus@mc.pp.se>
Subject: Re: [Qemu-trivial] [PATCH] bitbang_i2c: Fix spurious slave read
	after NACK
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
X-List-Received-Date: Sat, 28 May 2011 19:52:34 -0000

On Sat, May 28, 2011 at 3:55 PM, Marcus Comstedt <marcus@mc.pp.se> wrote:
> After NACKing a read operation, a raising SCL should not trigger a new
> read from the slave. =A0Introduce a new state which just waits for a stop
> or start condition after NACK.
>
> Signed-off-by: Marcus Comstedt <marcus@mc.pp.se>
> ---
> =A0hw/bitbang_i2c.c | =A0 =A05 ++++-
> =A01 files changed, 4 insertions(+), 1 deletions(-)

Seems like a simple change but I'm not familiar with the code or I2C
details.  Andrzej, care to take a look?

> diff --git a/hw/bitbang_i2c.c b/hw/bitbang_i2c.c
> index 4ee99a1..2937b5c 100644
> --- a/hw/bitbang_i2c.c
> +++ b/hw/bitbang_i2c.c
> @@ -38,7 +38,8 @@ typedef enum bitbang_i2c_state {
> =A0 =A0 RECEIVING_BIT2,
> =A0 =A0 RECEIVING_BIT1,
> =A0 =A0 RECEIVING_BIT0,
> - =A0 =A0SENDING_ACK
> + =A0 =A0SENDING_ACK,
> + =A0 =A0SENT_NACK
> =A0} bitbang_i2c_state;
>
> =A0struct bitbang_i2c_interface {
> @@ -115,6 +116,7 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int l=
ine, int level)
> =A0 =A0 }
> =A0 =A0 switch (i2c->state) {
> =A0 =A0 case STOPPED:
> + =A0 =A0case SENT_NACK:
> =A0 =A0 =A0 =A0 return bitbang_i2c_ret(i2c, 1);
>
> =A0 =A0 case SENDING_BIT7 ... SENDING_BIT0:
> @@ -155,6 +157,7 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int l=
ine, int level)
> =A0 =A0 =A0 =A0 i2c->state =3D RECEIVING_BIT7;
> =A0 =A0 =A0 =A0 if (data !=3D 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 DPRINTF("NACKED\n");
> + =A0 =A0 =A0 =A0 =A0 =A0i2c->state =3D SENT_NACK;
> =A0 =A0 =A0 =A0 =A0 =A0 i2c_nack(i2c->bus);
> =A0 =A0 =A0 =A0 } else {
> =A0 =A0 =A0 =A0 =A0 =A0 DPRINTF("ACKED\n");
> --
> 1.7.4.1
>
>
>


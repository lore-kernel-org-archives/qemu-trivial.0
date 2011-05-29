Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQV8n-0004Gn-Qd
	for mharc-qemu-trivial@gnu.org; Sat, 28 May 2011 21:50:05 -0400
Received: from eggs.gnu.org ([140.186.70.92]:46340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balrogg@gmail.com>) id 1QQV8l-0004A5-B9
	for qemu-trivial@nongnu.org; Sat, 28 May 2011 21:50:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balrogg@gmail.com>) id 1QQV8k-0000dM-EX
	for qemu-trivial@nongnu.org; Sat, 28 May 2011 21:50:03 -0400
Received: from mail-pz0-f45.google.com ([209.85.210.45]:35727)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balrogg@gmail.com>)
	id 1QQV8h-0000ct-QF; Sat, 28 May 2011 21:49:59 -0400
Received: by pzk30 with SMTP id 30so1311644pzk.4
	for <multiple recipients>; Sat, 28 May 2011 18:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=b42dslFDEtHQyOWDPuI1qxhJQaryYopILr+8y+0+B/8=;
	b=IQz6a9DEyY/K7owxJsUQoJFrb25OXENmzLJRBs+H3loI3qe9zCBBCEdFoipgFVF9fl
	Q/vMp7OV0qTRPf2iaWDr7686CM5DD6QLyEk//kZWvhSt3jaiSXncqtvqluHUhH9Hnaa6
	NWQLyqTT1R9waGDO+ASitfo6gZaU8L3BAYQUQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=HmD3dtgHwI0z7H8LZtrnZxfb4ftZ3Uo6aIXjeFD2Z9U+O1FKSc5Lz7M12IhbfF1zWs
	CttRdlJmcE1CkdcHiydcoB33lVB1ezNo1LPV+BVadVK94zIWVi9/0FfXDgsM8CGV/322
	X2l1yVPxV12AjjY+8p3APMz4aJwTjVCW5Gj5M=
MIME-Version: 1.0
Received: by 10.68.17.227 with SMTP id r3mr1412173pbd.396.1306633797484; Sat,
	28 May 2011 18:49:57 -0700 (PDT)
Received: by 10.68.43.73 with HTTP; Sat, 28 May 2011 18:49:57 -0700 (PDT)
In-Reply-To: <BANLkTinbdHYTdPgmZHwUBOb4xEmA=mjHnQ@mail.gmail.com>
References: <yf9sjryq3gn.fsf@chiyo.mc.pp.se>
	<BANLkTinbdHYTdPgmZHwUBOb4xEmA=mjHnQ@mail.gmail.com>
Date: Sun, 29 May 2011 03:49:57 +0200
Message-ID: <BANLkTikEz_JrJ38iONRf0f_bqGXHVaSLDw@mail.gmail.com>
From: andrzej zaborowski <balrogg@gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Marcus Comstedt <marcus@mc.pp.se>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] bitbang_i2c: Fix spurious
 slave read after NACK
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
X-List-Received-Date: Sun, 29 May 2011 01:50:04 -0000

Hi,

On 28 May 2011 21:52, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Sat, May 28, 2011 at 3:55 PM, Marcus Comstedt <marcus@mc.pp.se> wrote:
>> After NACKing a read operation, a raising SCL should not trigger a new
>> read from the slave. =C2=A0Introduce a new state which just waits for a =
stop
>> or start condition after NACK.

Makes sense, I pushed this change to master.

Cheers


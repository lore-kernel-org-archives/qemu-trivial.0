Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXSTE-00050S-0V
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 09:23:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXSTC-0004zC-7d
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 09:23:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXSTB-0006nY-Bw
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 09:23:22 -0400
Received: from mail-it0-x233.google.com ([2607:f8b0:4001:c0b::233]:34865)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXSTB-0006nL-7F; Tue, 18 Jul 2017 09:23:21 -0400
Received: by mail-it0-x233.google.com with SMTP id h199so8878444ith.0;
	Tue, 18 Jul 2017 06:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=lxVshmEKch6iBxUqoVRmZ0Dx6XEesh7sgGUoBXvJitI=;
	b=uyi38YccKR+wpej4R4BVVp4FCQdhPz+rRg1UcQKR4qRQZiM9qFmuECfEw2LHqbQCXo
	7647aWcHgijOD1eVx2wn+LjgB30L3r+fh1TcxDsRoCkezWT0XL6VJgFvXIkGrtGw1xfu
	N5PBm+BADTeyuvGjPyr2Luy2abh+PsvvYD0sCQ4cp8ejjZhamYZLPmp2+2VJZKqw+8tV
	OzkXp7KOYGI887/YwbtEm/HKJXyN5I0Cf9I5o3+9tfjxKvzoFqhah9+Hk6JUKdifg4/P
	iy/zkTeBk+yH+PmCfoDsxIQIUVZqmwFafdbzZTRdr2KHBNVx0GOz84OKXuJ+DiAq3q7E
	RwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=lxVshmEKch6iBxUqoVRmZ0Dx6XEesh7sgGUoBXvJitI=;
	b=iSVIIAhuOdZnCbc6hhDM/kifqqmd7CPr/8oVD0jpRdYm5U2RZ47a3sL/p+TB+DJcY6
	bN1v8NH/TfK8kooOUyaln+jOmEi+4p/pMOK7HqotNccykebAJF5WDyfmdt9dBgLcMLG5
	dkhxBp4y0Nu0N+PvXBYLchrZB2CyCm5/ymu0U4XiV7qn1x44LK3RdcdmXy94uv8+qPwe
	5jz2sX8+YpgWacypVJof6qG0ryCyrbs5NYChKyn/or99KJ/0rWlyWAbV+cqyhj5XgIM+
	9MSCn4afxI5Ilr8AOyS9Ay18/68lZQUdoPLSR+ikCupmunwkHpfuOZNbDs90rhlqy09f
	fSNQ==
X-Gm-Message-State: AIVw110KbJ0ZWUeU2NImEvlQj80KdUK87dn8dzlKsLuOvmbTXr7KWj4w
	8cnk6FGENJw1hz6jp+SXl6bNIDoHKg==
X-Received: by 10.36.152.136 with SMTP id n130mr403315itd.79.1500384200582;
	Tue, 18 Jul 2017 06:23:20 -0700 (PDT)
MIME-Version: 1.0
Sender: philippe.mathieu.daude@gmail.com
Received: by 10.107.152.16 with HTTP; Tue, 18 Jul 2017 06:23:19 -0700 (PDT)
In-Reply-To: <045101d2ffaf$ef4b60e0$cde222a0$@d-silva.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-8-f4bug@amsat.org>
	<045101d2ffaf$ef4b60e0$cde222a0$@d-silva.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 18 Jul 2017 10:23:19 -0300
X-Google-Sender-Auth: whwnk-16UI7nHQaXHO3kE3WVhg8
Message-ID: <CAAdtpL7MibpdNtmc-vJAGhjVh-FKpy0RzQkL=DCHr+WSnXqF7g@mail.gmail.com>
To: "Alastair D'Silva" <alastair@d-silva.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, 
	Corey Minyard <cminyard@mvista.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::233
Subject: Re: [Qemu-trivial] [PATCH 07/29] ds1338: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 13:23:23 -0000

On Tue, Jul 18, 2017 at 7:23 AM, Alastair D'Silva <alastair@d-silva.org> wrote:
> I'm not sure this makes sense - we're dealing with time here.

Indeed, thanks for your review!

>> --- a/hw/timer/ds1338.c
>> +++ b/hw/timer/ds1338.c
>> @@ -65,7 +65,7 @@ static void capture_current_time(DS1338State *s)
>>      s->nvram[1] = to_bcd(now.tm_min);
>>      if (s->nvram[2] & HOURS_12) {
>>          int tmp = now.tm_hour;
>> -        if (tmp % 12 == 0) {
>> +        if (QEMU_IS_ALIGNED(tmp, 12)) {
>>              tmp += 12;
>>          }
>>          if (tmp <= 12) {
>> @@ -154,7 +154,7 @@ static int ds1338_send(I2CSlave *i2c, uint8_t data)
>>                  if (data & HOURS_PM) {
>>                      tmp += 12;
>>                  }
>> -                if (tmp % 12 == 0) {
>> +                if (QEMU_IS_ALIGNED(tmp, 12)) {
>>                      tmp -= 12;
>>                  }
>>                  now.tm_hour = tmp;


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQNtJ-0008Ok-AW
	for mharc-qemu-trivial@gnu.org; Mon, 01 Feb 2016 18:28:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aQNtG-0008MJ-Qt
	for qemu-trivial@nongnu.org; Mon, 01 Feb 2016 18:28:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aQNtG-00027M-4b
	for qemu-trivial@nongnu.org; Mon, 01 Feb 2016 18:28:14 -0500
Received: from mail-ob0-x244.google.com ([2607:f8b0:4003:c01::244]:36334)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1aQNtE-00026o-5W; Mon, 01 Feb 2016 18:28:12 -0500
Received: by mail-ob0-x244.google.com with SMTP id wg8so9126519obc.3;
	Mon, 01 Feb 2016 15:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=mmCu7RbnEjx4B8LllQzVqD0unO5tD8qaU8vXtZ3kWsk=;
	b=AkCHwrgAAZqR1HkJBdRtz9GfFyE4HtGoMN0yVV7FPl9xTEBAJeBTzAGnju+CKVoRZn
	JvvMkJ8uuZ87POuUZKSG4sKXTeUdoU4psUbKUd6XmQCB9Ksau9LhI8ATcQs3ObNYuHTX
	0W+2SQz66dBRHqWRcuyHT7pbFMhwX4Wx8HaRTaIld2WU02E+bFUziIArB2GMgmqdLu7r
	RWCddpk/Et2Pt3dNyU1wuaAOG3yz0lwBYqyAWyWZRelErl9Nz2UcTUOmB1xWbRijgvXg
	xLSDKrAA8Y46UsjjrPZs6KlmfJaAGZT+qPyfF0QEahKswdBo7d0+8ZDFieSHuX3AIExh
	vsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-type;
	bh=mmCu7RbnEjx4B8LllQzVqD0unO5tD8qaU8vXtZ3kWsk=;
	b=aj1nNq47b46pnpkry7VgIbls4gr9UkulMeG78hMd7+Ou3Vj1WTZOwGsG7jzBrgZBQy
	aqUBZu496Z1+szm2SGyaE5dnYpSudls+9k2Byqoi1rTZNoT7xunDW7+UruR1wOfzv0OB
	gdJI0EoS8kiEjKQp5UMMICt+9CrUjDsI6MOvGipyAooD4ma5cvr8SFt8vWXjR6UE4HS+
	ROBX3/WhuXGOMFeT2NqYm3ULuj9ZdF50Z3TgbfpWQ/dih/j8Bfc02mwEzo6Zdd1EgNgl
	gVvIttXImJ47AbHjCrzLGMci+a6m5yXOglpN+xYWguHO0jXKGaJJiTLzgDreWvKGqQJq
	mM2w==
X-Gm-Message-State: AG10YOR1EPhaveUYriZ/R1x27qaCmyGFMTk8+vdEisqUnit9k9iiGrE+FHDe/tbRQh/NPoEKaO+aPhwPYmuMFA==
X-Received: by 10.60.63.81 with SMTP id e17mr19788643oes.21.1454369291347;
	Mon, 01 Feb 2016 15:28:11 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.182.49.199 with HTTP; Mon, 1 Feb 2016 15:27:41 -0800 (PST)
In-Reply-To: <56AC83DD.30503@msgid.tls.msk.ru>
References: <9aab0156c2f307ece61c3d8106450d736553a0d5.1453141118.git.alistair.francis@xilinx.com>
	<56AC83DD.30503@msgid.tls.msk.ru>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 1 Feb 2016 15:27:41 -0800
X-Google-Sender-Auth: m0c8_tk8xxPIcqsJpZmHYU5XcOw
Message-ID: <CAKmqyKN7Kox09N1WZtd8nBCc8Oy-L1Bm2Wwte_0DR6ntbzLsXg@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::244
Cc: christian.liebhardt@arcor.de, qemu-trivial@nongnu.org,
	christian.liebhardt@keysight.com,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1 1/1] qom: Correct
 object_property_get_int() description
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
X-List-Received-Date: Mon, 01 Feb 2016 23:28:15 -0000

On Sat, Jan 30, 2016 at 1:35 AM, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 18.01.2016 21:42, Alistair Francis wrote:
>> The description of object_property_get_int() stated that on an error
>> it returns NULL. This is not the case and the function will return -1
>> if an error occurs. Update the commented documentation accordingly.
>
> Applied to -trivial, thanks!

Thanks!

Alistair

>
> /mjt
>


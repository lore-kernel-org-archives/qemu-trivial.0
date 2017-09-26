Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwtHO-0008HK-7S
	for mharc-qemu-trivial@gnu.org; Tue, 26 Sep 2017 13:04:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dwtHM-0008GH-7z
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 13:04:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dwtHJ-0005YT-Tx
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 13:04:14 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:36816)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dwtHJ-0005Xg-Mc; Tue, 26 Sep 2017 13:04:13 -0400
Received: by mail-wr0-x244.google.com with SMTP id g50so2866404wra.3;
	Tue, 26 Sep 2017 10:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=SPOpOpjQnUCh3JtSNkAfbs0PXPag5qYVBNBW4oR9RFo=;
	b=mJOfcwhqZFUhNQcK7TVyOKAw/9005+lCJd4rL24OAl1uToguSOrqt9P50XAIfRXxDF
	UCDKZWNi/7L9K7/GqdedTzgZWe6XXR8svNqEoKu6pJqzL/P+QRO7EMdsiJQTA9qBPoaC
	nHa7SDv0VMLiOVQHOaUZV6TJsZtK8nmZ6PuxaZFA+CjULwkbT3bo9Pgvz5W+B833sDTJ
	oeTfRqk1S0/NJxSw+wP9Xm1p4rmpJS8Xid7rY/LoLMBlq06JQGyB/vS78gzgQG9/hBIy
	dJBLQ98cPG9/WlXHkhHU8qyyF1EJBE/u2gfjP7zmqjZ0xAXhJk52kc4SIkYtW4iQbuAC
	PU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=SPOpOpjQnUCh3JtSNkAfbs0PXPag5qYVBNBW4oR9RFo=;
	b=bXSwH4owk839fnG0zVBsccbnmmAZXUsuPWe/miYjn9ZtziKrKqpu8sC5rhqwGd+PL3
	+BvmEUVm9HeDg5H4Qc6ANk06Cu/9BKnWwhzyNCGXNe8tkT1Jx1YKqdkWmwqiG4/JvZT/
	6yH1KlFzRUo0nrmtPn0O9gRsNKZ3/7KjRtEmdVQI97S1dBhfB8tAGK2qyirbBisHfClp
	vpt4bduIwqy4q0yaHcb/snLhNDc5vu4msdLSayOPP4ALj3UFPeghYWVUl3wCUf5l7suu
	FOaBngfidhOYep0kqTjSUkhO9lfq9upNM0ow73vlYwbJfTzXQAgS9inXt4ghr9LkYIO9
	J5ow==
X-Gm-Message-State: AHPjjUj2yT9GeZYb696z27hw8IewsH79mqS1p7/zCY7nS8kf6AZXSY87
	+U9Uz2m6JfQgYJ3kxh2p0R95Hzl68YDlKThZCnM=
X-Google-Smtp-Source: AOwi7QAE91UXvlEYXfkIcUHX+EesWHr2enJ+Cqp9ja8dCWaarTDRtH7h1DB4UMdUIq2cQbypgZoy7v+TGwqykR1qRhE=
X-Received: by 10.223.169.143 with SMTP id b15mr10919560wrd.127.1506445452512; 
	Tue, 26 Sep 2017 10:04:12 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.135.139 with HTTP; Tue, 26 Sep 2017 10:03:41 -0700 (PDT)
In-Reply-To: <cbcf25a4-db9c-910f-fdbc-b7620d013b14@redhat.com>
References: <1506441116-16627-1-git-send-email-thuth@redhat.com>
	<CAKmqyKOCsyCHnaNzo_zrRQjZi30ENdPoSc+dFehHvevm-9nrZg@mail.gmail.com>
	<cbcf25a4-db9c-910f-fdbc-b7620d013b14@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 26 Sep 2017 10:03:41 -0700
X-Google-Sender-Auth: OveU2hl9mTYqPFcJUqtM2fPFEpg
Message-ID: <CAKmqyKO2jfVZ9d1epxVWKMy9FUfByCoVXMV4JQ-qGAV=vzKwnQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/arm/xlnx-zynqmp: Mark
 the "xlnx, zynqmp" device with user_creatable = false
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
X-List-Received-Date: Tue, 26 Sep 2017 17:04:17 -0000

On Tue, Sep 26, 2017 at 9:52 AM, Thomas Huth <thuth@redhat.com> wrote:
> On 26.09.2017 18:36, Alistair Francis wrote:
>> On Tue, Sep 26, 2017 at 8:51 AM, Thomas Huth <thuth@redhat.com> wrote:
>>> The device uses serial_hds in its realize function and thus can't be
>>> used twice. Apart from that, the comma in its name makes it quite hard
>>> to use for the user anyway, since a comma is normally used to separate
>>> the device name from its properties when using the "-device" parameter
>>> or the "device_add" HMP command.
>>
>> Is it worth changing the name now then as well?
>
> Not sure, was there a reason for this name? E.g. is it used in a device
> tree somewhere somehow? Anyway, with user_creatable = false, I think it
> is not so urgent anymore to change it.

I don't think there was a specific reason. Maybe it was copied from a
device tree, but I'm not tied to keeping the comma. Maybe that's
something we can investigate in the future.

Thanks,
Alistair

>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>
>> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
>
> Thanks!
>
>  Thomas
>


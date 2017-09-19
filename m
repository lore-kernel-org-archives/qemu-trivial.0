Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1duSMz-0002ef-L0
	for mharc-qemu-trivial@gnu.org; Tue, 19 Sep 2017 19:56:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1duSMy-0002eV-4i
	for qemu-trivial@nongnu.org; Tue, 19 Sep 2017 19:56:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1duSMx-0005Gw-8o
	for qemu-trivial@nongnu.org; Tue, 19 Sep 2017 19:56:00 -0400
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:34816)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1duSMx-0005FB-2j; Tue, 19 Sep 2017 19:55:59 -0400
Received: by mail-wr0-x241.google.com with SMTP id n64so582718wrb.2;
	Tue, 19 Sep 2017 16:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=D/M5+gXleJ8oMZxNoRJUO6d3XkV+m39Z6Agy5lfYNVw=;
	b=Sq+2gH0/ptIhBSB7Pd0yYdxhm/JoMbeGiStZBm+l1QEmC7if3oQrkZ1E4R4PH4Q2Jz
	g0CZq08ujsii+7GIb51NofjtNcOeJosMpX57RIfhmuhuC/k4hozgmw8amzH/MX0CHLyF
	MxPME4RTashGtjmwuH12QNYt3j5EnSUUxOCs8PSZgQsckrM9rwMmxG/Bz+5eiBIJ5RVm
	uJwqAavAQEqGZsiSD9hYuS/OBYtlznxoQyIxGzLskJlfwzf9hmtcIS//9ixI5lg6NsnK
	0ZU6SIXUePy09+vowtQMlJISZdQL79i3rN8hazFvikyyI8AC+XwdhjAGp+RytWMQSZIe
	DNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=D/M5+gXleJ8oMZxNoRJUO6d3XkV+m39Z6Agy5lfYNVw=;
	b=Az7JoxVSpbtbgg2HOGikDLYnZBwXnZTnEd0k03z4d4atYYpfNs4QxVYHMjYQVmByzE
	F3/rH7yy5gV+6oACUCYKc7BQWD2nltXOZinoPOBXnm/rZQr7QkWIyLpmA/9uSxVnZ/oE
	TIGIhVJQlW+8K3g/mzN5loK93dht8XLOM1e62LDfdMj9Ze+c9LLkeLye+/1y7QH8/FTZ
	Y6SHmHj9hf6xG2sEqxeWDx4MOvosC1yvBDHnIzaB4EIY7BNA+XYKAPL2yjm+xUx5emT/
	4JmBcYRNaPoaFJDXOCuvWuCHUl6PbqK5UTHvwgphuzvM8VaercA5ZsvktZhGirkSQQFl
	Zojw==
X-Gm-Message-State: AHPjjUi3oq12GqasvJUxYh9K0yMm6pUbiuvgHL5EoUbs79szakXdxxV3
	SsoUiqPccmYjeMU+lOkr6u4ANISddkOnqJxebTI=
X-Google-Smtp-Source: AOwi7QD5WUvpSV7R5CzPUFwOqO553jHWDtwjzs3X77IsJnrDe47CjVCWY9RZFS4MXohR7yJGLOY1g4yYsEX1WnkUZAA=
X-Received: by 10.223.187.74 with SMTP id x10mr2631452wrg.66.1505865356309;
	Tue, 19 Sep 2017 16:55:56 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.191.130 with HTTP; Tue, 19 Sep 2017 16:55:25 -0700 (PDT)
In-Reply-To: <CAMo8BfJp=dLbgGsqu8rKAoKxTkMNRHeAUcT74pQSdCpKWqxLPg@mail.gmail.com>
References: <134bcf2e2c0bb9160aa822ddfbc46d9bd51c4305.1505512474.git.alistair.francis@xilinx.com>
	<CAMo8BfJp=dLbgGsqu8rKAoKxTkMNRHeAUcT74pQSdCpKWqxLPg@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 19 Sep 2017 16:55:25 -0700
X-Google-Sender-Auth: 1vV2ecDqB063MbleZip2wIwB1PY
Message-ID: <CAKmqyKPkCpVpBaEWuHX541uq+V-jvOhommWKiPXXs+cgK3MqLQ@mail.gmail.com>
To: Max Filippov <jcmvbkbc@gmail.com>, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: Re: [Qemu-trivial] [PATCH v2 1/1] target/xtensa: Use the
 pre-defined MEMTXATTRS_UNSPECIFIED macro
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
X-List-Received-Date: Tue, 19 Sep 2017 23:56:01 -0000

On Fri, Sep 15, 2017 at 3:37 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Fri, Sep 15, 2017 at 2:56 PM, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> Instead of using the hardcoded (MemTxAttrs){0} for no memory attributes
>> let's use the already defined MEMTXATTRS_UNSPECIFIED macro instead.
>>
>> This is technically a change of behaviour as MEMTXATTRS_UNSPECIFIED sets
>> the unspecified field to 1, but it doesn't look like anything is
>> checking this field.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>> V2:
>>  - Update commit message to indicate the change in behaviour
>>
>>  target/xtensa/op_helper.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Acked-by: Max Filippov <jcmvbkbc@gmail.com>

+ QEMU trivial, can this go through you?

Thanks,
Alistair

>
> --
> Thanks.
> -- Max


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ccMDX-00060t-0t
	for mharc-qemu-trivial@gnu.org; Fri, 10 Feb 2017 20:11:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ccMDV-000600-CG
	for qemu-trivial@nongnu.org; Fri, 10 Feb 2017 20:11:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ccMDU-0006Sk-Bp
	for qemu-trivial@nongnu.org; Fri, 10 Feb 2017 20:11:09 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:33530)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ccMDU-0006Sb-72; Fri, 10 Feb 2017 20:11:08 -0500
Received: by mail-oi0-x241.google.com with SMTP id j15so3618829oih.0;
	Fri, 10 Feb 2017 17:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Q1qZJ1InE+QysMwcUzzgBAeuEI5dGswsaSriWRprPj8=;
	b=hNXiohAOZr/TDz4J2DpKXHnKKHA6g6NYnmJd8VcxYeg4DTkYeCzDBLyiyIzRIn/0L1
	SPOLr2voESzYwxa/wmdgQ9L+jqJUIm89bT7x8sgf1IOr9QbDaYiHAh6mrO2Z7u/xeVFp
	JNITvfDXCSvVYreSNpS96P0BzNi3H8qZlGx/1mfWzDmfu6Y5WBM/G/MOc4wTxEXpxfbK
	UiUNpqj8wMNlZzRQZXWsfVmsjwEXXXFFKWhEG9CRC1CV/eKu5aFnV1FRRXYjMYg+7dut
	Mqz9V96Rcvon6fxJbJx0Ozg8Jd8zmhZC5KVFskx2Ybbnf9TE6l9elbgrXhyijkBpDFZs
	QOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Q1qZJ1InE+QysMwcUzzgBAeuEI5dGswsaSriWRprPj8=;
	b=uE21N2e4lJBnW5KfWoFRAJM73D2Wm7N+nLtd73H5mtsm++YirNBTcSfkbMjqhblLsI
	7wkz26/nyWTz4T8htzF2F3C35joXllcKoan2VECPwIwQqf9aJY1Ntv3fSo6/5wOG0DKW
	TrifxiRmbivw2H2fM8Gpba5IqfQvyWLH0MwsRQx/4bK+JmxFPpRTNdfGwayeUrxNhHWV
	H1U+6N2JZoj8f5YBgSp/oLryb8Xkk2NH/ThmxZh/CQgTWeB2r7jq1WhOka1yDjLwCe6u
	K3cjHVR0zOvDKbRT6gsS93a2j4dvf3oQbNOMznZDDWxutjRmmZbf7PDkOuSq0D0fsMBS
	4yfg==
X-Gm-Message-State: AMke39lJnNNzzOIaL2BJPGBftS5wDTiekw9yc0czEikN/74mw4oDWXRRMGdsCCAYoXDEsh7QREJjiOAh2FIcCA==
X-Received: by 10.202.252.216 with SMTP id a207mr5475524oii.98.1486775467620; 
	Fri, 10 Feb 2017 17:11:07 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.183.26.67 with HTTP; Fri, 10 Feb 2017 17:10:37 -0800 (PST)
In-Reply-To: <87r337ako2.fsf@dusky.pond.sub.org>
References: <1486576658-29719-1-git-send-email-thuth@redhat.com>
	<87r337ako2.fsf@dusky.pond.sub.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 10 Feb 2017 17:10:37 -0800
X-Google-Sender-Auth: s6iRYHwRuK96X-9t6Iur0Uqb8-o
Message-ID: <CAKmqyKPDj2XNsRA+7H4zhL2f4xuG0uZLrFPh5E7WnMAiP0=iCw@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] hw/core/register: Mark
 the device with cannot_instantiate_with_device_add_yet
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
X-List-Received-Date: Sat, 11 Feb 2017 01:11:10 -0000

On Wed, Feb 8, 2017 at 11:27 PM, Markus Armbruster <armbru@redhat.com> wrote:
> Thomas Huth <thuth@redhat.com> writes:
>
>> The "qemu,register" device needs to be wired up in source code, there
>> is no way the user can make any real use of this device with the
>> "-device" parameter or the "device_add" monitor command yet.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

>


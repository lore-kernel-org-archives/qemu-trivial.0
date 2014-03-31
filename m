Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WUlyo-0003ex-Vt
	for mharc-qemu-trivial@gnu.org; Mon, 31 Mar 2014 19:51:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WUlye-0003GQ-HA
	for qemu-trivial@nongnu.org; Mon, 31 Mar 2014 19:51:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WUlyV-0005tj-CQ
	for qemu-trivial@nongnu.org; Mon, 31 Mar 2014 19:50:52 -0400
Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235]:41707)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WUlyC-0005nc-2E; Mon, 31 Mar 2014 19:50:24 -0400
Received: by mail-pd0-f181.google.com with SMTP id p10so8581768pdj.26
	for <multiple recipients>; Mon, 31 Mar 2014 16:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=bbJu0rTiS0W1mn9saX143orty3voy21pOws2FT8UtSU=;
	b=PHNZp8QQ6v88BL2H6/YqHA9eQCE5sRp8zbM7xJk9U1VlRhXyBb0bJ4edZoISFO2vih
	oUHZoYKmCUmbuLgq0b7Y97WuqQt+QMhEwH8SJfRhCTHxsj1C9JUKpbxlWqa5BFBZIorB
	QtQt+yYCd4i1qmwIQD/a/vtgeKE8yDgCxzQAGpSU2jkxuFaxSNYz82HfncDeIhbdqVnQ
	J2ghunRk+eq2uAI9rjl7mBCnUnw7V97ddl5G6Xy/nkl83kbHwnHdbvrMkl9yI4WNQFH6
	DJXlBaFFYjQdO4uHTup6dZN6U59ud+aQHeADQ/mE7AIgpnPh7LEbef6zcc6tN6h64qnM
	5yHA==
X-Received: by 10.66.217.133 with SMTP id oy5mr28136952pac.46.1396309822375;
	Mon, 31 Mar 2014 16:50:22 -0700 (PDT)
Received: from [192.168.1.104] ([124.126.238.155])
	by mx.google.com with ESMTPSA id
	iu10sm45828926pbd.71.2014.03.31.16.50.19 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 31 Mar 2014 16:50:21 -0700 (PDT)
Message-ID: <5339FF38.1060508@gmail.com>
Date: Tue, 01 Apr 2014 07:50:16 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <53337BEB.90305@gmail.com> <87wqfgrp83.fsf@blackfin.pond.sub.org>
	<5333F6E2.9080202@gmail.com> <53382DDD.8050001@gmail.com>
	<87fvlylf02.fsf@blackfin.pond.sub.org> <53396545.805@gmail.com>
	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>
	<533969AB.4010505@gmail.com>
	<CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>
	<53396CE9.9090405@gmail.com>
	<CAFEAcA9dk3991gc+FK0qp9QwhWkjxO0vK=X1TxS37Y1sXD5RNw@mail.gmail.com>
In-Reply-To: <CAFEAcA9dk3991gc+FK0qp9QwhWkjxO0vK=X1TxS37Y1sXD5RNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::235
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl.c: use 'break' instead
 of 'continue' in configure_accelerator()
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
X-List-Received-Date: Mon, 31 Mar 2014 23:51:01 -0000



On 03/31/2014 09:33 PM, Peter Maydell wrote:
> On 31 March 2014 14:26, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
>> Next, when I send trivial patches, I will only send to qemu-trivial (not
>> send/cc to qemu-devel again), that will be more efficient.  :-)
> 
> No, please always send to qemu-devel; just also cc qemu-trivial
> (or the relevant subsystem maintainers as listed in MAINTAINERS)
> if appropriate. Not everybody subscribes to qemu-trivial.
> 

OK, thanks.

And when send trivial patch, I will/should always mark it as "[PATCH
trivial]" to let another members know about it easily, and always cc to
qemu-trivial.


Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed


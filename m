Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WUcLe-0000fM-J0
	for mharc-qemu-trivial@gnu.org; Mon, 31 Mar 2014 09:33:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WUcLX-0000d3-8Q
	for qemu-trivial@nongnu.org; Mon, 31 Mar 2014 09:33:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WUcLQ-0003bA-Gn
	for qemu-trivial@nongnu.org; Mon, 31 Mar 2014 09:33:51 -0400
Received: from mail-la0-f47.google.com ([209.85.215.47]:38448)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WUcLQ-0003ay-AA
	for qemu-trivial@nongnu.org; Mon, 31 Mar 2014 09:33:44 -0400
Received: by mail-la0-f47.google.com with SMTP id pn19so1532310lab.34
	for <qemu-trivial@nongnu.org>; Mon, 31 Mar 2014 06:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=k9GhdwsExc3Xla2nTZrwS5TLsNkrEiUyydeVAa8wh20=;
	b=MJi2ZJ71kUQk87XAvjLNzKHdVF6c99NlHvVi11gYu6iQx+lXZegO+Z2ellpoI0hel4
	0zqMfzZE6M2Hpw/jPg9BklVMbtihsSJDWM7JGxaGUR+6EB9qnuRACr72fT9852VAjRRj
	bq0qCF6vpX6KfTySiZm60r5qK3kR1YnqWeLwesZ7jmLzDxaB6DL3a2mI91fIo9yP7yRr
	BFYhTmi/iwoBQqKc5/G2LXpJH+nCz8nlie1GuXuomF6eznk0pXZppo/FLww8dz1ga3js
	DFBQ+G8PHiCfo8wMrGahd+vQeNOFHX1LNVvf060mTdxj/msnDtKmwCqybOH2nEvrijGM
	pt1A==
X-Gm-Message-State: ALoCoQmLxUxEg+bcJ9pm5LqQUAGcgb2o4/FXN5dMgOtr0lcxAqWKXg0IHo7M5/K4kVlnvMntrTYu
X-Received: by 10.112.163.69 with SMTP id yg5mr17789984lbb.14.1396272823076;
	Mon, 31 Mar 2014 06:33:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.180.233 with HTTP; Mon, 31 Mar 2014 06:33:18 -0700 (PDT)
In-Reply-To: <53396CE9.9090405@gmail.com>
References: <53337BEB.90305@gmail.com> <87wqfgrp83.fsf@blackfin.pond.sub.org>
	<5333F6E2.9080202@gmail.com> <53382DDD.8050001@gmail.com>
	<87fvlylf02.fsf@blackfin.pond.sub.org> <53396545.805@gmail.com>
	<CAFEAcA-GL7bnZ-Pkga9PzDq7DpwPf8Gx0Wezzkm_CCbSUB1W8A@mail.gmail.com>
	<533969AB.4010505@gmail.com>
	<CAFEAcA_w=35e9dVL_Zo84MoxZqCUH9qJ76v=Pn=XQ0FZq8g_-g@mail.gmail.com>
	<53396CE9.9090405@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Mar 2014 14:33:18 +0100
Message-ID: <CAFEAcA9dk3991gc+FK0qp9QwhWkjxO0vK=X1TxS37Y1sXD5RNw@mail.gmail.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.47
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
X-List-Received-Date: Mon, 31 Mar 2014 13:33:57 -0000

On 31 March 2014 14:26, Chen Gang <gang.chen.5i5j@gmail.com> wrote:
> Next, when I send trivial patches, I will only send to qemu-trivial (not
> send/cc to qemu-devel again), that will be more efficient.  :-)

No, please always send to qemu-devel; just also cc qemu-trivial
(or the relevant subsystem maintainers as listed in MAINTAINERS)
if appropriate. Not everybody subscribes to qemu-trivial.

thanks
-- PMM


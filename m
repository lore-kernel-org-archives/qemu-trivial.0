Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXQ9p-0001lp-26
	for mharc-qemu-trivial@gnu.org; Mon, 16 Mar 2015 04:13:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YXQ9m-0001kI-QR
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 04:13:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YXQ9m-00008m-3n
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 04:13:50 -0400
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c]:35128)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YXQ9h-00007s-Ko; Mon, 16 Mar 2015 04:13:45 -0400
Received: by wibdy8 with SMTP id dy8so30853399wib.0;
	Mon, 16 Mar 2015 01:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=QqfDmGmu9XZtD+WB4NBsw07X2McXVIokpNK7BRWw4P4=;
	b=Jg7nQwW/JBjPDnmEHUp3Uow5mh8Wk7FXKFvNSGjaHV4KULL6WaNGWXB+j9kj2wdp75
	gZWp3Wv221mSqIGhRigNW64r4Ci1q9Omwy66Gqvxkfa8rsbHMUZjnTZ4T1ROYScPQCZy
	8BilfYNbiPDJ8gF3qsNUqUaYQ5iQraK6n2SrG/lGI39eNnlZh/R9zoSEloM2Oe3tn5ND
	3YZMSFV7l6MjVHLzYXxmcce2ANpVtVzcNew5HBqBrLxLb0hbomsn2lllUeu1rBtdbOi4
	+UMNnZj7sNsYIClOiUAo8I2Y0sPxXCt8L5zze1xT51QSJfIUL4Zp7Ohx3ZpYBtFo0Atp
	Pxpw==
X-Received: by 10.194.134.68 with SMTP id pi4mr121242023wjb.101.1426493625111; 
	Mon, 16 Mar 2015 01:13:45 -0700 (PDT)
Received: from [192.168.10.150] (net-188-216-23-124.cust.vodafonedsl.it.
	[188.216.23.124]) by mx.google.com with ESMTPSA id
	dj5sm14233699wjb.28.2015.03.16.01.13.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Mar 2015 01:13:43 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <550690B4.7000506@redhat.com>
Date: Mon, 16 Mar 2015 09:13:40 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1426326454-7216-1-git-send-email-zhaoshenglong@huawei.com>	<55040865.8050908@weilnetz.de>
	<55054F1D.2080408@redhat.com>	<55055DBA.9040804@msgid.tls.msk.ru>
	<55059324.8030202@redhat.com>
	<87a8zd4cy7.fsf@blackfin.pond.sub.org>
In-Reply-To: <87a8zd4cy7.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22c
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	Stefan Weil <sw@weilnetz.de>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com,
	shannon.zhao@linaro.org, Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-trivial] [PATCH] hw/bt/sdp: Fix resource leak detect by
	coverity
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
X-List-Received-Date: Mon, 16 Mar 2015 08:13:51 -0000



On 16/03/2015 08:29, Markus Armbruster wrote:
> > Well, in this case the bug in bt_l2cap_sdp_close_ch is much worse than a
> > resource leak.  But bluetooth is not the utmost priority in QEMU
> > development...
> 
> To put it more bluntly: it's rotting in peace.
> 
> Occasional drive-by fixes won't stop the rot, a dedicated maintener
> could.

I disagree.  The code is not that good, but apparently it works.
Samsung folks are using it and presented their work at KVM Forum 2014.

Paolo


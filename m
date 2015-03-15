Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YX9Gs-0006PZ-12
	for mharc-qemu-trivial@gnu.org; Sun, 15 Mar 2015 10:12:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YX9Gq-0006PS-2r
	for qemu-trivial@nongnu.org; Sun, 15 Mar 2015 10:12:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YX9Gl-0002eU-1I
	for qemu-trivial@nongnu.org; Sun, 15 Mar 2015 10:12:00 -0400
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c]:35094)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YX9Gk-0002e1-QG; Sun, 15 Mar 2015 10:11:54 -0400
Received: by wibdy8 with SMTP id dy8so19392245wib.0;
	Sun, 15 Mar 2015 07:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=KzeNAoqrqpA3jgQulf+ZFSZ+Icf7mToZWWKSmE4qbd0=;
	b=VL1hztLhgH5ggHsokIiASDWahSYQnNoXmXQbB4vlc8iOTDm6825eOrDBj91tD0umpf
	PfmG3rGU9BI4/zElZ9XtbO+bHqCbe+lxgcRUSWeUvEWhO9CRYO3PEMTgDDpjjDjsjKFX
	h+P5lKausQNat2SIwqoIdEAUqLtN4KCTVnKyACygBZPH/fj9IMkek6YO5s6AjW9KeBsH
	okNRHhKeic5qWejWUH1xACqiVGjTFjFRYyvnHGw7EdNPnva4s9Rq1W2qIJuwUAkNei72
	0AsTBXYuX0NroUghsfDwTghxKf+lvLx+Cjxg88eLT4eM3gp8767DD+o7vmf63/SlV+ho
	wOXQ==
X-Received: by 10.194.71.175 with SMTP id w15mr109650498wju.16.1426428713721; 
	Sun, 15 Mar 2015 07:11:53 -0700 (PDT)
Received: from [192.168.10.165] (net-188-216-23-124.cust.vodafonedsl.it.
	[188.216.23.124]) by mx.google.com with ESMTPSA id
	a13sm11165036wjx.30.2015.03.15.07.11.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 07:11:51 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <55059324.8030202@redhat.com>
Date: Sun, 15 Mar 2015 15:11:48 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, Stefan Weil <sw@weilnetz.de>, 
	Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1426326454-7216-1-git-send-email-zhaoshenglong@huawei.com>	<55040865.8050908@weilnetz.de>
	<55054F1D.2080408@redhat.com> <55055DBA.9040804@msgid.tls.msk.ru>
In-Reply-To: <55055DBA.9040804@msgid.tls.msk.ru>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22c
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, hangaohuai@huawei.com,
	peter.huangpeng@huawei.com, shannon.zhao@linaro.org
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
X-List-Received-Date: Sun, 15 Mar 2015 14:12:00 -0000



On 15/03/2015 11:23, Michael Tokarev wrote:
> Or, alternatively, to keep this `data' pointer in sdp to use it in
> bt_l2cap_sdp_close_ch().

Yes.

>> > In any case, it seems simpler to just leave this code aside.
> How many times this code is called?
> 
> We have many many places in qemu where resources are allocated once
> at startup and never freed just because there's no need to.

Well, in this case the bug in bt_l2cap_sdp_close_ch is much worse than a
resource leak.  But bluetooth is not the utmost priority in QEMU
development...

Paolo


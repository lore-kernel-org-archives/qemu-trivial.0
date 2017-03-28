Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cslys-0003xp-5A
	for mharc-qemu-trivial@gnu.org; Tue, 28 Mar 2017 03:55:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cslyq-0003wv-JR
	for qemu-trivial@nongnu.org; Tue, 28 Mar 2017 03:55:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1cslyn-0008ME-HC
	for qemu-trivial@nongnu.org; Tue, 28 Mar 2017 03:55:52 -0400
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:35764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1cslyn-0008LT-8r; Tue, 28 Mar 2017 03:55:49 -0400
Received: by mail-wr0-x242.google.com with SMTP id p52so17112445wrc.2;
	Tue, 28 Mar 2017 00:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=lU17VvWHm6OZwJyg2nZWopGNBHt/wy4H6hdAt4YbQHo=;
	b=JNcrYVv76USPjydFZzWK3dkl1fNNxXrfsl7hcejkYXjDPCQ9phnjz85EcFh7ofrjdw
	xu+0fNIuMqvySKVRee+ssroKW2GncsHc931IvKzd/ml4GUmrVgTZKv3IKJ/Xw6jAHjlW
	/t68Ab01M3VF9TO+FDcDjM4n/Tjc8CpOCFqUeCeVORi+hwNeu97KmvaoEiHNYGnG/b+I
	0MMmRev+SeovDXaTcNc/WjQJnqxVlaIDAHzzt6JuiTyXFVLzSYVgvFQUDVrcZPGX0Yo2
	YDTcPSs2z1IiE6pQ0SEvUi2sTQ8K3g/CblZqSXMNKjEPB5E1TPL2lTU4BVk7br8HvliF
	uCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=lU17VvWHm6OZwJyg2nZWopGNBHt/wy4H6hdAt4YbQHo=;
	b=kU17BNw0NiyoaxHZMHERQmCuIcRTIPjHg93xHJUh+cHqW3BKFjCOA9lyOwUkg7xMGQ
	65Jj8vvBYPI9DfSgP6tyDl1oTH8N4cdqOJJVpPs73X87J30MHyDLOaFKjeqC9S5VUQnm
	XJv2FgXYqB1KhegsLt/cGtNB5ExiNbJcQma39hCCyVfcttgGkZsATy/vZHW+RVc2zNCO
	dHmREvfUUwm1suSPK1hAELrpJyCEOLQGmMoHfrOBdMiXjdpDn0jmYG9LuJMT4Zbt5TfH
	Yno+bhbNpEm+qy4HzMHiCc7xQPvDjptA4g75Ote/y1U8U4DJUvPte20Ma7dXN9jQ547i
	rbDw==
X-Gm-Message-State: AFeK/H1ygft7+VFNvzWtc6ScvniGQvC2yNx8/rAI+3FzkuSQ8UiXiZobXcTVmWisHYv8Uw==
X-Received: by 10.28.68.69 with SMTP id r66mr12607609wma.115.1490687747845;
	Tue, 28 Mar 2017 00:55:47 -0700 (PDT)
Received: from [192.168.10.150] (94-39-135-166.adsl-ull.clienti.tiscali.it.
	[94.39.135.166]) by smtp.googlemail.com with ESMTPSA id
	h76sm2460026wmd.33.2017.03.28.00.55.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Mar 2017 00:55:47 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20170327165005.22038-1-stefanha@redhat.com>
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Peter Lieven <pl@kamp.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d9d2fcdb-d744-4cff-4373-7bbb3fc5c6b7@redhat.com>
Date: Tue, 28 Mar 2017 09:55:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170327165005.22038-1-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-trivial] [PATCH] iscsi: drop unused IscsiAIOCB.qiov field
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
X-List-Received-Date: Tue, 28 Mar 2017 07:55:53 -0000



On 27/03/2017 18:50, Stefan Hajnoczi wrote:
> The IscsiAIOCB.qiov field has been unused since commit
> 063c3378a9e3c25cc0afac3c72e4823d0621e352 ("block/iscsi: introduce
> bdrv_co_{readv, writev, flush_to_disk}") back in 2013.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/iscsi.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/block/iscsi.c b/block/iscsi.c
> index 75d8905..716e74a 100644
> --- a/block/iscsi.c
> +++ b/block/iscsi.c
> @@ -103,7 +103,6 @@ typedef struct IscsiTask {
>  
>  typedef struct IscsiAIOCB {
>      BlockAIOCB common;
> -    QEMUIOVector *qiov;
>      QEMUBH *bh;
>      IscsiLun *iscsilun;
>      struct scsi_task *task;
> 

Queued, thanks (don't know if for 2.9 or 2.10 right now).

Paolo


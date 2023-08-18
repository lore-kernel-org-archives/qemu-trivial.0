Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qX1Zf-00076S-5N
	for mharc-qemu-trivial@gnu.org; Fri, 18 Aug 2023 11:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1qX1ZZ-00071q-R3
 for qemu-trivial@nongnu.org; Fri, 18 Aug 2023 11:39:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1qX1ZX-0006y1-EF
 for qemu-trivial@nongnu.org; Fri, 18 Aug 2023 11:39:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692373174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VnOAnR1mAHey59wJJe5lzj4SidLujLRF9gak9OXwuiA=;
 b=cZrhgbDG1O5PdvhXvfLG1PmjtYY3Bd6w8PGmFxDfaz+cw/MVh8z5idAoqVoyx6nobopY7h
 qSK+rQ84XMgPeOy3syp4yvwTxOmJg+YN9hSmzQj0BMkNhiENi6ozaDziNaUs7LjhPWA+FZ
 +6JELfayQgMVcYp0t3UgRCwKa+/39Zs=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-IgCJD-IgPe6WER5HwqDXfg-1; Fri, 18 Aug 2023 11:39:32 -0400
X-MC-Unique: IgCJD-IgPe6WER5HwqDXfg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B5763C0FCA6;
 Fri, 18 Aug 2023 15:39:32 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 691632026D68;
 Fri, 18 Aug 2023 15:39:30 +0000 (UTC)
Date: Fri, 18 Aug 2023 17:39:29 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH trivial] qemu-img: omit errno value in error message
Message-ID: <ZN+QsRrUmIQRR7v8@redhat.com>
References: <20230811110946.2435067-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811110946.2435067-1-mjt@tls.msk.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Aug 2023 15:39:40 -0000

Am 11.08.2023 um 13:09 hat Michael Tokarev geschrieben:
> I'm getting io-qcow2-244 test failure on mips*
> due to output mismatch:
> 
>   Take an internal snapshot:
>  -qemu-img: Could not create snapshot 'test': -95 (Operation not supported)
>  +qemu-img: Could not create snapshot 'test': -122 (Operation not supported)
>   No errors were found on the image.
> 
> This is because errno values might be different across
> different architectures.
> 
> This error message in qemu-img.c is the only one which
> prints errno directly, all the rest print strerror(errno)
> only.  Fix this error message and the expected output
> of the 3 test cases too.
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

Thanks, applied to the block branch.

Kevin



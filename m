Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1t15wP-0006Qh-Rr
	for mharc-qemu-trivial@gnu.org; Wed, 16 Oct 2024 11:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1t15wH-0006Of-4W
 for qemu-trivial@nongnu.org; Wed, 16 Oct 2024 11:27:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1t15wF-0000Te-3o
 for qemu-trivial@nongnu.org; Wed, 16 Oct 2024 11:27:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729092468;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bJagOfY7XeY7xVYGDImrD0m6sTBfUOdm/qPDi88+B1g=;
 b=Ghq0hlRkTKRarw9n8SpybPEP1M6nYHALbytdBBrIRQhJaU/P78yTDOt/iUjJOxrKUCrNuw
 LV7wGFhM9gucVkuWUIqzpk02aarSbZQsqzlA21jKH3G+RbBJ3vH8bo/C8jYe4QbfefpuXj
 x3YOgnbxMjxQlmP87O1ztA1thSY5FOY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-152-P5DikXT1OzCu-HnEozQSVA-1; Wed,
 16 Oct 2024 11:27:46 -0400
X-MC-Unique: P5DikXT1OzCu-HnEozQSVA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5C2B11955F42; Wed, 16 Oct 2024 15:27:45 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.95])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EF6C019560AE; Wed, 16 Oct 2024 15:27:42 +0000 (UTC)
Date: Wed, 16 Oct 2024 16:27:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-stable@nongnu.org, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 marcandre.lureau@redhat.com, Fabiano Rosas <farosas@suse.de>
Subject: Re: [PATCH] tests: Wait for migration completion on destination QEMU
 to avoid failures
Message-ID: <Zw_bZn2QlRIxYIVo@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241016152159.1168722-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241016152159.1168722-1-stefanb@linux.ibm.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.038,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 16 Oct 2024 15:27:55 -0000

On Wed, Oct 16, 2024 at 11:21:59AM -0400, Stefan Berger wrote:
> Rather than waiting for the completion of migration on the source side,
> wait for it on the destination QEMU side to avoid accessing the TPM TIS
> memory mapped registers before QEMU could restore their state. This
> error condition could be triggered on busy systems where the destination
> QEMU did not have enough time to restore the TIS state while the test case
> was already reading its registers. The test case was for example reading
> the STS register and received an unexpected value (0xffffffff), which
> lead to a segmentation fault later on due to trying to read 0xffff bytes
> from the TIS into a buffer.
> 
> Cc: qemu-stable@nongnu.org
> Reported-by: Fabiano Rosas <farosas@suse.de>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  tests/qtest/tpm-tests.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594BFC54F54
	for <qemu-trivial@archiver.kernel.org>; Fri, 31 Jul 2026 14:18:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wpo3k-0006tS-IE; Fri, 31 Jul 2026 10:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wpo3f-0006t6-Td
 for qemu-trivial@nongnu.org; Fri, 31 Jul 2026 10:17:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wpo3e-00021z-2S
 for qemu-trivial@nongnu.org; Fri, 31 Jul 2026 10:17:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1785507471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DtnXACq17l5xDCt2ldY2aqbYBGn1HmpqVYkUR8hOa84=;
 b=P3lXx+R9h98+DBWv2R87CGrhSGGy9/hpT6yA4IGYQECHHzmtb/EqTizNMoPJyM6EFqYMmZ
 yz7KrZ/e3RQ4iVaJQWG736VgLlwZ8hlBuq+nFCYQeLw7I1Lznxf0ecvQ4xqh946uVFqUyr
 hVUgeOVDAn141naQP9a5oCjh9oS1fLw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-qWLPBEAwOqOXo8AUpa7GGw-1; Fri, 31 Jul 2026 10:17:50 -0400
X-MC-Unique: qWLPBEAwOqOXo8AUpa7GGw-1
X-Mimecast-MFC-AGG-ID: qWLPBEAwOqOXo8AUpa7GGw_1785507470
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51bff5c7035so19407221cf.2
 for <qemu-trivial@nongnu.org>; Fri, 31 Jul 2026 07:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785507470; x=1786112270;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=DtnXACq17l5xDCt2ldY2aqbYBGn1HmpqVYkUR8hOa84=;
 b=C53GnBNVBhltf1EnWNpUrLTzv5+cM9VRHrM1p7eOPhfLp1t9oFzG2Xa99J53iGhIHQ
 C3uovlXUDK6ok3SchSqykBMPZ8nJSOBjOkxX7d3sKaBQ7tyhydALRbXqUz8QRflt5GLL
 DgTMyNaP0ROBMLuJoj7G8EGE1MkLzrwixyDERDcxg6izgr4/ULFJRBwYTIWaYfDIUbsn
 u53lLXCI7aAp2GIt1kWs/ixRuU08NGNI+FP8CWCPd1US8XOeU7uR6uO7NFaLa8yywSo4
 VL7akw+/MWjhTDf/laNRcWUb2H76Oxt7SsVI5A64r7PS4jJ+V+joK7z4SGS8UKW1ZDq2
 rNVg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpqnkYFnLxgHieFcrHZcQ+i/1kqNaNeweDKif2jaTbPD6rs8z3fDB/JxKKsX/XW8aADp19PPUb4dGga9A0=@nongnu.org
X-Gm-Message-State: AOJu0Yy05vVEgvAdUDS0+VaKs3kirnhYAS573mfSo44Wim4oNQOrTa4e
 /ij1PatwCmGij99rD/25WmJ50NfVjqON2RMvztlDugl5PJjWrQufo5tjEU8SctBKrg6qBWwWYfu
 a/e6BNTn1AGHx30ogW/+/ENuLHKjr4BR9QAlzKdHaqjcgFyCv83M9DH09Gy8=
X-Gm-Gg: AR+sD13t7TPuaGmAoNXT4GW/q8sS0UE0N/cM1H1wTJkblDIvD2dV5Csc4+sUQnfMbei
 h0SDgF+SpkUSEsyx4cOpauOorNpipQm1d96AAU2TBKdCGSrZ+trDny4l/LkQsxFvwZxzSqC3i8B
 4psqbXnkfYq1nM3iKIvtKZ/ohnz0oD70bM+VBCsaR5Ic1WZ4nuPSGSRCyQchwcfOti7gOshH/Di
 jw7yDWsK00Hu2QMxH2Q6qDoiD+8PnkurFB+wojT441TnCnTX0frO1PffYD3vRFdQ5QUD04S1vhR
 kMVofoIE0vBzx8qePP6MCe3UJrHDqKzrzdTYqnFRCVQrVElJ4pONKI6vXHIcodDez7LOpAXZ
X-Received: by 2002:a05:622a:4085:b0:527:7521:3f8 with SMTP id
 d75a77b69052e-52b568070b3mr4544211cf.44.1785507469593; 
 Fri, 31 Jul 2026 07:17:49 -0700 (PDT)
X-Received: by 2002:a05:622a:4085:b0:527:7521:3f8 with SMTP id
 d75a77b69052e-52b568070b3mr4540401cf.44.1785507466883; 
 Fri, 31 Jul 2026 07:17:46 -0700 (PDT)
Received: from x1.local ([2605:8d80:6c28:a264:ecff:d5b4:39f6:3dd5])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52b4eb921f5sm8531241cf.21.2026.07.31.07.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 07:17:46 -0700 (PDT)
Date: Fri, 31 Jul 2026 10:17:42 -0400
From: Peter Xu <peterx@redhat.com>
To: Sam Heney <github@me.samiser.xyz>
Cc: qemu-devel@nongnu.org, farosas@suse.de, qemu-trivial@nongnu.org
Subject: Re: [PATCH] tests/qtest/migration: Only build tls_no_hostname test
 with TASN1
Message-ID: <amyuhgeXLH-xXTp8@x1.local>
References: <5f24de0e-49af-45a7-927f-f79b203bb335@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <5f24de0e-49af-45a7-927f-f79b203bb335@app.fastmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Dwfh1t6vjqRGDMK11W-n26dxJJPxSnG9EbwXSIUpFnA_1785507470
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.58,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On Thu, Jul 30, 2026 at 11:59:44PM +0100, Sam Heney wrote:
> The test_precopy_tcp_tls_no_hostname test and its start hook use
> TestMigrateTLSX509 and migrate_hook_start_tls_x509_common(), which
> are only defined when CONFIG_TASN1 is set. This means building with
> gnutls enabled but libtasn1 unavailable fails:
> 
>   ../tests/qtest/migration/tls-tests.c: In function 'migrate_hook_start_tls_x509_no_host':
>   ../tests/qtest/migration/tls-tests.c:510:5: error: unknown type name 'TestMigrateTLSX509'
> 
> Guard the test with CONFIG_TASN1 like the other x509 tests.
> 
> Fixes: df9c38b19af8 ("tests/qtest/migration: Add a NULL parameters test for TLS")
> Signed-off-by: Sam Heney <github@me.samiser.xyz>

queued, thanks.

-- 
Peter Xu



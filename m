Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37547CCFA1A
	for <qemu-trivial@archiver.kernel.org>; Wed, 12 Nov 2025 08:30:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vJ6FF-0001Kh-Q5; Wed, 12 Nov 2025 03:30:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vJ6FB-0001IK-LS
 for qemu-trivial@nongnu.org; Wed, 12 Nov 2025 03:30:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vJ6F7-0000Yi-AU
 for qemu-trivial@nongnu.org; Wed, 12 Nov 2025 03:30:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762936212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=OhXrSIc9huIh8pK72MIHZNpkDviqCEr4OyuU16Rp3K1V2YIj1GaDS26NCxO7tg48sCr4nm
 mwm467mJFD/XbOVywDSuqnH47DGLzHOGfi9RsGpw5IRrpWpug7QZLjYObsdjQ8mrzy9K+h
 BwQzI0mWjl/Isy1yyng2Mgn8R/6eXuY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-t1o0X9ahNUGqXRz_mS0QXg-1; Wed, 12 Nov 2025 03:30:11 -0500
X-MC-Unique: t1o0X9ahNUGqXRz_mS0QXg-1
X-Mimecast-MFC-AGG-ID: t1o0X9ahNUGqXRz_mS0QXg_1762936210
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47113538d8cso2678925e9.1
 for <qemu-trivial@nongnu.org>; Wed, 12 Nov 2025 00:30:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762936209; x=1763541009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=DA/NCMxrOCFVFCUNcEj7wUBDCDT5BwM/Lkw+5ft8CJb2zg+b28AyiqDZDK2JSjHVjP
 3SQkH3s3O8CEupDS1Y2Gql8pZfHdb8KgLT7AkejkMTytepBASYyb6Nlz9ihNE9DkJp1Y
 2Dcv5bVaAh/GEuscWOSF7Y3CMJ9PF+pExjMJxpzkvMAmcqVwz49BmU76JHG+Njde8eWC
 3jpk+nrHHtitm5UB3tXGU1O30rPxK5SaWQiwHoV/i/cPDRtwrBAEPgDYIV05FET+D1o6
 V5CZbnxsGM4dsCebiL+WFTzoT0IJkthGD3d2gUjegPsJhtPdWcLDHxsuaZhuxLhLsZHQ
 REMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVjbh82qq6FWLDHEK7Ws7OMr7SboCR+L9M7ILuvmPoSqWcCgpC9RRebegtOoXB2SUy5CCCRPl0rbDO2Uc=@nongnu.org
X-Gm-Message-State: AOJu0YxQq7BIFwOUsGI3Mpks7XUjbK3s+noPsYPkXtdjfsrWucrFS7au
 bLvKgbn7j79KOZcHwqkKG203Er0lmjAuU5wNvOEt/sj2tIrNfpsZWm6cJNKUta5auWN3i9muxPm
 igzhaHzH0rR67vR63E1s4H22RWYkBn8ieoKDIDKTtPZR2A2ldstn4L+FYL47OUk8yXXA=
X-Gm-Gg: ASbGncvZwUqdDWuK3a1vDqY3MVByj871bRmXgyu4XjxloOkzpIvA22BkUOmC9YNgSi9
 nWHBYJl3XI2JeHGXt0In+10kXTapzQ+fOLW1PwnhicXivqsHDi0drLT1l6f4VUglH6E41SJECxY
 K4iyofZPG29VQ34i4hjkCX0HYYrfzG27bpl2iwBHZwvmg5luW/s7Hb72F+L2DxIOgdl38EUsDY+
 AJk/7dGjMFzef7/K36h1D0wWTvpgGvYNVO8e35KVKDHleMclSec/zhjKsSK2f41Veo9Kti5SDVx
 +n0x4gx2/vk2i0aniqgo88ihU8EqghIxAAVtAtzy0jZfOezijSt+Br/HAgLFHsjibFoH0SEiYg8
 sCZzk0D1JTpfKEpIqqRFQq7Pn222qJVfbWCZVBR4FGRDqwCNa1KBTspW/ov+4DafIw5eIiMAKWJ
 RR0k95Hw==
X-Received: by 2002:a05:600c:c493:b0:475:dd9a:f786 with SMTP id
 5b1f17b1804b1-477870be153mr16157665e9.40.1762936209310; 
 Wed, 12 Nov 2025 00:30:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrPkZeoCx0w6wc2L0ze4J5LK1TOLmB4zvIQ8c5Q7FNViKH1YsR+V8oMsiuQCz2fHDdhmHENg==
X-Received: by 2002:a05:600c:c493:b0:475:dd9a:f786 with SMTP id
 5b1f17b1804b1-477870be153mr16157485e9.40.1762936208969; 
 Wed, 12 Nov 2025 00:30:08 -0800 (PST)
Received: from [192.168.10.48] ([176.206.111.214])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e51f54sm23548525e9.8.2025.11.12.00.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 00:30:08 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Nicholas Mosier <nmosier@stanford.edu>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org
Subject: Re: [PATCH] i386/tcg/svm: fix comma operator typo
Date: Wed, 12 Nov 2025 09:30:06 +0100
Message-ID: <20251112083006.277792-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251111-i386-svm-vmexit-typo-fix-v1-1-49f0414472cd@stanford.edu>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Dq16f0jfJplA6vR-3gbbbrdUqqOw2Xo4HUoMGREUJFw_1762936210
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

Queued, thanks.

Paolo



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pCp9c-0004ll-NB
	for mharc-qemu-trivial@gnu.org; Tue, 03 Jan 2023 16:49:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pCp9b-0004lP-9s
 for qemu-trivial@nongnu.org; Tue, 03 Jan 2023 16:49:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pCp9Z-0001KB-Iq
 for qemu-trivial@nongnu.org; Tue, 03 Jan 2023 16:49:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672782540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5rDE+vtGNq8pa9kgZ6PtbuxvyH/cA7sc1qRD4WaTmIk=;
 b=MCEwpeWLUkDbv3m5K6cwuP52YdkzgYEsH27KWqKCOx+K3G68XTi0xbevbxFtYAF2mkKIF6
 cEYWzkt957pMcl1KVoLVWO4BI0BEmCA6WV4DtJWzYyC4v1fs1p3tttVjcqMKy2he5hE0ch
 cyu6piD4nJnRPkgixFe89Ew+E14rLpE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-252-VD9pvQ3zN82SbZkivXdkRQ-1; Tue, 03 Jan 2023 16:48:59 -0500
X-MC-Unique: VD9pvQ3zN82SbZkivXdkRQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 cf23-20020a05622a401700b003ab6e87db28so9895740qtb.18
 for <qemu-trivial@nongnu.org>; Tue, 03 Jan 2023 13:48:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5rDE+vtGNq8pa9kgZ6PtbuxvyH/cA7sc1qRD4WaTmIk=;
 b=KB01NOZOEcmdrTH0Q44tRYMCFDNosZ1rF6seAxSW1jUpztec7kv1gehPBB85XMHodL
 L5e5EFw+WowwjbP5RWrbPND661I6e4l8voYS3RCERc3kkqAg/u/QRvMssihXmctr5Odh
 d+2K0voT6RWaTv+fwl5tZ7pg+SbAfPGQ4HuBAbJZDnVPgVN4bvNSMoMYycKklX/aWDPh
 ERWaj68TM7fYYnAPoBtY+tyr1PuwbM1RrqvcOmbTQaXNc9w56W+P0dEMzT2s1Pg11I4j
 8rp/Dl5QjTWTFlr1Pwe2ft+2Eq9fSdvAzUcOJ89+oxKoaxKyd/ShPrlmjRG77qA//U6W
 pJyg==
X-Gm-Message-State: AFqh2kpAiu8icyfhqjX51LgDxcZJ5klBhjwkpRq9BpduGBNnqSRc7fLb
 iR47/W+bdJOfiigqjspjFTXkw3cDn1LfAx+JVpk+LM2jEhEySnKZkLuLt/1NrROtDTuT4O+cDPQ
 cHZdFEJJHA4tnwI7OUA==
X-Received: by 2002:ac8:4b44:0:b0:3a7:ff64:8c00 with SMTP id
 e4-20020ac84b44000000b003a7ff648c00mr57277003qts.22.1672782538915; 
 Tue, 03 Jan 2023 13:48:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXujZ3z5d0+KhNx9nmUJgXcdMHwf8f7+cYPVapTwToz080T3YckI45f7LT9mmd8Tynhn1sa99A==
X-Received: by 2002:ac8:4b44:0:b0:3a7:ff64:8c00 with SMTP id
 e4-20020ac84b44000000b003a7ff648c00mr57276988qts.22.1672782538719; 
 Tue, 03 Jan 2023 13:48:58 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-39-70-52-228-144.dsl.bell.ca.
 [70.52.228.144]) by smtp.gmail.com with ESMTPSA id
 w18-20020ac86b12000000b003a6934255dasm19264476qts.46.2023.01.03.13.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 13:48:57 -0800 (PST)
Date: Tue, 3 Jan 2023 16:48:56 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>
Subject: Re: [PATCH] memory: Do not print MR priority in flatview HMP output
Message-ID: <Y7SiyMhw9yLX/eG9@x1n>
References: <20221228130439.80341-1-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20221228130439.80341-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 03 Jan 2023 21:49:03 -0000

On Wed, Dec 28, 2022 at 02:04:39PM +0100, Philippe Mathieu-Daudé wrote:
> When requesting the flatview output with 'info mtree -f',
> the MemoryRegion priority is irrelevant and noise. Remove it.

It is in many cases still helpful debugging information to me.

Maybe it's because it can cause mis-alignment when the priority >= 10?  If
that's the case, how about tabbing it properly instead of removing?

Thanks,

-- 
Peter Xu



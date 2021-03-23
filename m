Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lOiaW-0008Do-Fr
	for mharc-qemu-trivial@gnu.org; Tue, 23 Mar 2021 11:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lOiaU-0008BI-Rq
 for qemu-trivial@nongnu.org; Tue, 23 Mar 2021 11:04:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lOiaT-0002Tj-BM
 for qemu-trivial@nongnu.org; Tue, 23 Mar 2021 11:04:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616511890;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Qmj97rjvukiZQXStNLtjrqOF+gonfJqLw/T6ZtqqzOE=;
 b=OZITaWP4x051QCGTnlJjpIVJ24kFkOKC4T+rRMGGI3h1WuoDZ3PUP+9xYMDHLuvz2YSm2Z
 6Pmc8IRFv4e0L8r6gpvt+8wyRJEIU8lyCyL0KDff6wv5IaELTmdvhmYkYPyziRz2KcFC4j
 uB4P07jr6XYB1IGS898Pn6jaTN+osMY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-OVCiGOzDO8-2RfFg76iM-g-1; Tue, 23 Mar 2021 11:04:49 -0400
X-MC-Unique: OVCiGOzDO8-2RfFg76iM-g-1
Received: by mail-wm1-f71.google.com with SMTP id w10so1219654wmk.1
 for <qemu-trivial@nongnu.org>; Tue, 23 Mar 2021 08:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=Qmj97rjvukiZQXStNLtjrqOF+gonfJqLw/T6ZtqqzOE=;
 b=I0x4RAppwoh2tr9DwZaPW9eDW93Bz/yaGf4eTGVgCBqemgve18MVXYjaOfn5xrm/V8
 bXcP0DXIQiU3dd/hUz7jX9pIBZDu3msDl1cVxTZq7UEb1gScte4BNTeyU0dupskDu7Ni
 IUiU3GFIYO9P5DO4hbEoYcKa9K3K3w3S2TdAgWE4qWfuk6mSVX5BLUi43ulFlqJhhXne
 ti1y/hQKHw5yrH1JItmcOQIg/lpUX0nnfyaAlo6OGe2vFOj4AdcV/sFhzZu7r0wEH2as
 jmL1/BULmtVDWJeyaiAA+/9NNYU+E2cywbbbQDPcqju9hwGSr8CY4aZR/sN8X7Dnp3yC
 dx/A==
X-Gm-Message-State: AOAM531YNEZ1UGX59AGgNT+haYifFocQOkawDXUdFL7iV5atzG/2PiMc
 iqrWp6IlN5F7hM+arA1/ynkVNDCzs2IV5CK/Tuje4HFXPCLqEsDZjTfFPZjkZG9WT5pA39PrrXe
 0aXT1GB4kzioe3wjAgw==
X-Received: by 2002:a1c:6241:: with SMTP id w62mr3793368wmb.79.1616511887126; 
 Tue, 23 Mar 2021 08:04:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYrD/o0IwHv5v0lalFAHz1HL3sCJV7Y7H49pFfkM2MhdOEvRvZgcAX70FsG8AWmWh2TwKlGw==
X-Received: by 2002:a1c:6241:: with SMTP id w62mr3793334wmb.79.1616511886864; 
 Tue, 23 Mar 2021 08:04:46 -0700 (PDT)
Received: from localhost ([94.248.65.59])
 by smtp.gmail.com with ESMTPSA id e8sm2971008wme.14.2021.03.23.08.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:04:46 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2] meson: Propagate gnutls dependency to migration
In-Reply-To: <20210320171221.37437-1-jrtc27@jrtc27.com> (Jessica Clarke's
 message of "Sat, 20 Mar 2021 17:12:21 +0000")
References: <20210320164730.33285-1-jrtc27@jrtc27.com>
 <20210320171221.37437-1-jrtc27@jrtc27.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Tue, 23 Mar 2021 16:04:48 +0100
Message-ID: <87mtutewrz.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Mar 2021 15:04:55 -0000

Jessica Clarke <jrtc27@jrtc27.com> wrote:
> Commit 3eacf70bb5a83e4775ad8003cbca63a40f70c8c2 neglected to fix this
> for softmmu configs, which pull in migration's use of gnutls.
>
> This fixes the following compilation failure on Arm-based Macs:
>
>   In file included from migration/multifd.c:23:
>   In file included from migration/tls.h:25:
>   In file included from include/io/channel-tls.h:26:
>   In file included from include/crypto/tlssession.h:24:
>   include/crypto/tlscreds.h:28:10: fatal error: 'gnutls/gnutls.h' file not found
>   #include <gnutls/gnutls.h>
>            ^~~~~~~~~~~~~~~~~
>   1 error generated.
>
> (as well as for channel.c and tls.c)
>
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

I would preffer to be the other way around, i.e. modularize tls out of
migration, but a fast look at it shows it as a big job.  As said on the
commint message, channel.c & tls.c both use tls not conditionally.
Once there, multifd.c also requires tls compiled in.
Can we realistically build qemu without tls nowadays?

Later, Juan.



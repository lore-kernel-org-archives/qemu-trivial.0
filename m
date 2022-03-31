Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nZzZY-0005do-Pi
	for mharc-qemu-trivial@gnu.org; Thu, 31 Mar 2022 14:31:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZzZS-0005Y6-9U
 for qemu-trivial@nongnu.org; Thu, 31 Mar 2022 14:30:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZzZQ-0004bV-Ud
 for qemu-trivial@nongnu.org; Thu, 31 Mar 2022 14:30:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648751456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wqeRyMd4XKneb/AG7E6oEXxBnZkMFMHWYStW0LLVJuI=;
 b=CwYAh5VuhqmHykI3nCxuh9GcYZP1g7MvwterSsDbalaW5/ft4/PwuC9rB8kx++XNQMu8Gy
 6sNxRvWNppYbfFfWxz5LtBH62DWWju6ddgQ1/+Y1IOpt8Vi5rOXHR1WuU70vyqowqdmPgH
 nwuKL0D29oS+6yqL6qHYCioJzNHg1A4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-W1SDMnd-OPqxo9ouCwNF4A-1; Thu, 31 Mar 2022 14:30:54 -0400
X-MC-Unique: W1SDMnd-OPqxo9ouCwNF4A-1
Received: by mail-qt1-f200.google.com with SMTP id
 f22-20020ac840d6000000b002dd4d87de21so147230qtm.23
 for <qemu-trivial@nongnu.org>; Thu, 31 Mar 2022 11:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wqeRyMd4XKneb/AG7E6oEXxBnZkMFMHWYStW0LLVJuI=;
 b=0P2ES86GYL0EgyNHOhyYToHhhFxV1SvoEdqJwxTfSLvMugmcCYl0H20wM4hRJeYWbT
 vMAg6l3t4NMyPrhyEMYXEyuc4fgeBJDfXv4EkxMOQAN8sairAO0JuC5mRK7g7807qQq2
 WNxnGg4/8IM53OkRqBeumyop2DBklKsxANnU+eF3COqC5SwyNyswKLSpqUSnUCuBBz6r
 No88mALsMdl0isruRoI/GfnuXpCHAeIL7UNujulz2IjI9qlSh3X5QFijxMe/zT8BowL9
 +8Q33bBW9JDhyYYl039WDucCgSpwBl8aH7Zi0Wds8PRY52BcWj7sYyvnos+pYfgdSjcO
 iy0w==
X-Gm-Message-State: AOAM533s0ARoqOQXJqgyWoOKr3sM9KYxY0nIcIqiIyQWq+zr+KnWsHLV
 xysffxekzpFe3O++6G2891asfT5CIlK5FanD/R5HBOkSP2XtIEKZdYsLNkaVYB+aoP3l54GhPNk
 avlOotq/ca0qYYNzZFQ==
X-Received: by 2002:a0c:f801:0:b0:427:47d3:3715 with SMTP id
 r1-20020a0cf801000000b0042747d33715mr36818524qvn.46.1648751453107; 
 Thu, 31 Mar 2022 11:30:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwc53MPLroqefayhAFrDHqYBmpIukK6Xpn1VNb9VM8bx/hX9hxYjd0l/oELM6xFuc7D7dACZw==
X-Received: by 2002:a0c:f801:0:b0:427:47d3:3715 with SMTP id
 r1-20020a0cf801000000b0042747d33715mr36818508qvn.46.1648751452899; 
 Thu, 31 Mar 2022 11:30:52 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a05620a288100b0067b1be3201bsm25816qkp.112.2022.03.31.11.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 11:30:52 -0700 (PDT)
Date: Thu, 31 Mar 2022 14:30:51 -0400
From: Peter Xu <peterx@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] util: Return void on iova_tree_remove
Message-ID: <YkXzWzb7Z9ee0hGF@xz-m1.local>
References: <20220331181712.535039-1-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220331181712.535039-1-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 31 Mar 2022 18:30:59 -0000

On Thu, Mar 31, 2022 at 08:17:12PM +0200, Eugenio Pérez wrote:
> It always returns IOVA_OK so nobody uses it.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu



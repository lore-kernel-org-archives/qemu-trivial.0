Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1maPR2-0005lV-Of
	for mharc-qemu-trivial@gnu.org; Tue, 12 Oct 2021 17:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1maPQx-0005kN-Oi
 for qemu-trivial@nongnu.org; Tue, 12 Oct 2021 17:35:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1maPQt-0000wj-3x
 for qemu-trivial@nongnu.org; Tue, 12 Oct 2021 17:35:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634074531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=29q75LC+JUVOOjoifmxp49BhYm2mlSeaookr7bh2p+o=;
 b=XDrZfNJ1zZOMw644Ylnc1Aidu9ii+g2WrpPyYfnOt/P3DBv81TrClZnUY4zhu3DRFwtMcx
 KD6onKxcnvdaX2H0ZE7drEm0MJysciNz56Tfabx4G64e5FVks35/CN4I+TkqJc8YJn1SnR
 XgFSOTn472qcC31MCQffiLJ0leRgnQw=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-v1z5x_SNMZa-CHLF9AmYSg-1; Tue, 12 Oct 2021 17:35:30 -0400
X-MC-Unique: v1z5x_SNMZa-CHLF9AmYSg-1
Received: by mail-pl1-f200.google.com with SMTP id
 ba4-20020a170902720400b0013a432f7556so146477plb.4
 for <qemu-trivial@nongnu.org>; Tue, 12 Oct 2021 14:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=29q75LC+JUVOOjoifmxp49BhYm2mlSeaookr7bh2p+o=;
 b=f37beysLhKr2tcmIq0Z1wGli//IhPSlEWlLuW919yJ8fCa+F5KEO0dqjS6j14XdZHK
 qsoCuZVjgfa+y63G+UbXducBLOLqqrHBBCyiSIOVvHWsYrPWZHwBIPTUrODOURyxa/lq
 X5tK0WKKFBgNaoDVRUXCIx2lQN0DvjuqpMubOZMbWfPIWKWf2VuesVdjkdmnj+5nXelW
 M8ss8N4dw3WJ12CJllSATkFmaO5vibkFsB6mOfWEFG4fj8djmf/++4cUOJMDoEGn6Zjs
 tMEnGUJUQJ+Jt0ZgEaoRAD8M7Q04JqVyu/uhL0b8Qe6P2MF5MBdSukN1DrYfLl1E+fux
 6EFw==
X-Gm-Message-State: AOAM530jqj36gDQk38yd25DZ2ZmvJvqhI8hvlR8RaGEssOA9Fe1Vfj8i
 FDlNc5hMCLad2PcIm1nlWAqXSDB3jjULRBLhlKq2qS0ZxUNeHjh3/Ln8s4tjBVqkAomq3RkVXze
 XkfweYxhg7WqjoS9Gdg==
X-Received: by 2002:a17:90a:b105:: with SMTP id
 z5mr8620997pjq.64.1634074529673; 
 Tue, 12 Oct 2021 14:35:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbtIA7CRu85YrxRnC8SI796MK+lRwLt8ZAMt4DEeh+GVkzbltlrFcTiWo0Ge1UB30qy9ttNg==
X-Received: by 2002:a17:90a:b105:: with SMTP id
 z5mr8620966pjq.64.1634074529379; 
 Tue, 12 Oct 2021 14:35:29 -0700 (PDT)
Received: from t490s ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id x15sm6701475pgo.48.2021.10.12.14.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 14:35:28 -0700 (PDT)
Date: Wed, 13 Oct 2021 05:35:21 +0800
From: Peter Xu <peterx@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 1/1] util: Make some iova_tree parameters const
Message-ID: <YWX/mWSZSs1zvKVz@t490s>
References: <20211012155001.811160-1-eperezma@redhat.com>
 <20211012155001.811160-2-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211012155001.811160-2-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 12 Oct 2021 21:35:40 -0000

On Tue, Oct 12, 2021 at 05:50:01PM +0200, Eugenio Pérez wrote:
> As qemu guidelines:
> Unless a pointer is used to modify the pointed-to storage, give it the
> "const" attribute.
> 
> In the particular case of iova_tree_find it allows to enforce what is
> requested by its comment, since the compiler would shout in case of
> modifying or freeing the const-qualified returned pointer.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu



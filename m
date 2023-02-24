Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVUNQ-0001H5-SQ
	for mharc-qemu-trivial@gnu.org; Fri, 24 Feb 2023 04:28:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pVUN3-00011l-4W
 for qemu-trivial@nongnu.org; Fri, 24 Feb 2023 04:28:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pVUN1-00044L-Ri
 for qemu-trivial@nongnu.org; Fri, 24 Feb 2023 04:28:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677230883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=IJ99hljLifP5zMmWxrnHoHgU3HnYYx4wsbtZvBoCXssP2LfDnZJN1c2lRmV5yWC11/JmLj
 C78SSV5ZajjDksvG6Ho4vZnvCw53YwimdtFV1ZVj27TjQdW86eFzkNFTl+uCkUO/dVPGgR
 3G3aQ5ApyQdIh5l7xWVHRtkbGRt6Usc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-eWu9zX9sPsqeyWpCFsmgkA-1; Fri, 24 Feb 2023 04:27:59 -0500
X-MC-Unique: eWu9zX9sPsqeyWpCFsmgkA-1
Received: by mail-ed1-f69.google.com with SMTP id
 ee6-20020a056402290600b004ad51f8fc36so18732889edb.22
 for <qemu-trivial@nongnu.org>; Fri, 24 Feb 2023 01:27:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=FqxHh7S2rw10fG4ZZ1BWPKTHBThzNCn2ZkDHmELYDnCVFdGw2m7HQL8QOvO43Gn+LA
 zaO6wZ9PdOjtKa6T4YFSooXJNA0vZUCB5Jhmq8FAriDRmGbpK3UuXK+8FZwCK0N5XVym
 hyZ3+wySODYRfJ0+Lu0Vrz40QQSPw57zm8SE7IgpQYHe2nNFtIYDWZe61h96QX5BQHcv
 swBbuH/V7IhcfwsEGhnBv1NiAjDn5UPAKZeVJvsRUZQymzg64HT+ssQuWZhZY6W85aO8
 w8x7r9zmiWJ3uO4OJ/NAl/uLDUdNOSxWvEw1W6EEj8p3YSeVHj4eL7XpNsLY3/exWvtL
 J79A==
X-Gm-Message-State: AO0yUKVLGTnigaLCmvzEvQ8qOiqvbKJkP0s0i9w33IiMf05RyBK6Bbql
 ChiBV08mYHH42YiQkpf55CFXR9R57Z/lCEONKoQgEKnSESOa27vPGASvq7uTQNTUZvXXZlgRCcY
 EamBa/e+cL5T9U5RTBQ==
X-Received: by 2002:a17:906:16d9:b0:886:221b:44e5 with SMTP id
 t25-20020a17090616d900b00886221b44e5mr21651748ejd.62.1677230878877; 
 Fri, 24 Feb 2023 01:27:58 -0800 (PST)
X-Google-Smtp-Source: AK7set9dVChQ13OYiC7tZJhaId9LPQjRUq07UelBvCKWdZiFOwi60dnHBAZx13NqlauHGSPvPxnz7Q==
X-Received: by 2002:a17:906:16d9:b0:886:221b:44e5 with SMTP id
 t25-20020a17090616d900b00886221b44e5mr21651734ejd.62.1677230878537; 
 Fri, 24 Feb 2023 01:27:58 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 y21-20020a170906519500b008b2e4f88ed7sm9245882ejk.111.2023.02.24.01.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 01:27:57 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Cover RCU documentation
Date: Fri, 24 Feb 2023 10:27:56 +0100
Message-Id: <20230224092756.593742-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230119102620.5669-1-philmd@linaro.org>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 24 Feb 2023 09:28:05 -0000

Queued, thanks.

Paolo



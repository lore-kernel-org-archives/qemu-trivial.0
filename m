Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1slp8G-0005Sy-JI
	for mharc-qemu-trivial@gnu.org; Wed, 04 Sep 2024 08:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1slp8E-0005S0-Pp
 for qemu-trivial@nongnu.org; Wed, 04 Sep 2024 08:29:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1slp8D-0006b0-1h
 for qemu-trivial@nongnu.org; Wed, 04 Sep 2024 08:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725452943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=gNC+O2BFgtGIcqKCe9mXMoCVx8tLDAyvkol/c8hBH+zKOaNjPIxIn/GCNVaNLTBFiGpdjc
 dn+zWw6YMroRbmeoZ331FHVs10rcwo6uJ0sUzBD2nHq+sMXi1CyyyvFs6c25R5vdo2YgZD
 QcsJnj5UXSOMcFOvAUGpaojpR6cVxm0=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-KOWYyDAqOpifJQemapoW2A-1; Wed, 04 Sep 2024 08:22:56 -0400
X-MC-Unique: KOWYyDAqOpifJQemapoW2A-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5344b7df784so7236798e87.1
 for <qemu-trivial@nongnu.org>; Wed, 04 Sep 2024 05:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725452575; x=1726057375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=mRJXIO2CTZ4+9ahkc4TVSi3++zef6ZKKIHHc5nli9U9+9W1EidV7DaHNrKDFXWLgLi
 rB4yEQ8opoM/02mpbwDNUUszOBhFVnZX9vC9frIrjttzbAld3oV3n4yEYCs4rbU41kLY
 83GTXKN9Eai1iu4UzEEpJYIHTSL4K+wL967oZFbKRNEXFHaPf/kPOLnnxS5Iflty5BRA
 O4l5oXrDEbHdHsatb0pEghaXO+tHDaA8KZYShLfFPaMgHt43+V+1w0BTDV6kRRQzJX4F
 mr2BbDE6Doi/ZUNLzTtKJ3It1rJMf2ToDLFLw8ytjNUgjDR/PQryBtfWPn/m8sdZGDv/
 GbPA==
X-Gm-Message-State: AOJu0YzsBRlGbZlFGmnYsvSaDZPgIEBl7e+1sHeQIT3teC9Rvf8uUYWa
 zbmy9CsP+kyCXzSOGeKCyoxcSyxxCdXeoC1b8hxSk9tnxO/eNUISd5blvEa0f7wlQSeAzgWCSVj
 FKrJV24Is6draJONvcgYq6ukGs3GY60nEXNCRjT/vLGPMBl1zOrxgg5s=
X-Received: by 2002:a05:6512:1394:b0:533:45dc:d2f0 with SMTP id
 2adb3069b0e04-53546b931c8mr12244907e87.46.1725452574924; 
 Wed, 04 Sep 2024 05:22:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+Em0B4WQdVj+ndnKwa/MbfNw8FPzXnZlE20GbqZw5nEF0AYhy1vnhNsCfI1VGJOe2LODBcA==
X-Received: by 2002:a05:6512:1394:b0:533:45dc:d2f0 with SMTP id
 2adb3069b0e04-53546b931c8mr12244886e87.46.1725452574413; 
 Wed, 04 Sep 2024 05:22:54 -0700 (PDT)
Received: from avogadro.local ([151.95.101.29])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898922295csm798832966b.198.2024.09.04.05.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 05:22:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Ani Sinha <anisinha@redhat.com>
Cc: qemu-trivial@nongnu.org, zhao1.liu@intel.com, armbru@redhat.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v6] kvm: replace fprintf with error_report()/printf() in
 kvm_init()
Date: Wed,  4 Sep 2024 14:22:53 +0200
Message-ID: <20240904122253.281351-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240828124539.62672-1-anisinha@redhat.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Wed, 04 Sep 2024 12:29:07 -0000

Queued, thanks.

Paolo



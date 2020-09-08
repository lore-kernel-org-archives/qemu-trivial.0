Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kFc7R-0005Aa-Jm
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2020 07:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kFc7P-0005A1-A1
 for qemu-trivial@nongnu.org; Tue, 08 Sep 2020 07:48:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45215
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kFc7M-0002Vj-Bt
 for qemu-trivial@nongnu.org; Tue, 08 Sep 2020 07:48:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599565733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u8O7hJM5AuZX/Sk1/iv9MFeyt3ahre9xP4PIk00IXpo=;
 b=duQAwKII5P0aSkADt6PTWCYXLkKE8Wl5efc+nbUX6EbIezsmP2xfjaIAqYeA8dyVSKH56n
 SOZMDHbPDSaepqoS80QPxmpdqvtQv7uMPWSRJLfTJwk0VDEa4Op5Xvzg2QyjG9HKufI1Pr
 Cba4sWIIeLpRB8/9mXyDIvquiMgjROA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-4OXSJqy2PUSaEkx35WEQAA-1; Tue, 08 Sep 2020 07:48:52 -0400
X-MC-Unique: 4OXSJqy2PUSaEkx35WEQAA-1
Received: by mail-ej1-f71.google.com with SMTP id gt18so6549867ejb.16
 for <qemu-trivial@nongnu.org>; Tue, 08 Sep 2020 04:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u8O7hJM5AuZX/Sk1/iv9MFeyt3ahre9xP4PIk00IXpo=;
 b=MfA9KJkNN007rosWEZP97dyDBdVK54Td+voQAqLQ/rzAxrjN0LM6LnGDNfF2QjwB+J
 TboYeo+9HxDFTV85LPdcIrOxSMAlBQ2kg4jjpGWf9tw/FM3dkFpKLKIe9oWkWG91nhUb
 b0spSDQ/pzIGpTchgJkbTuMnASeTnPJCWAWb6lCyC+6U3AizypS8aLk3aVNVnzKS7unl
 7fjh7PC+5GlFJng6d5YQrnrFQ+maB1pdBFJvbukKZQXL6ETS44tgYVubt86WfIFn40Gq
 IzZlawpLOGo9otXiFE9noSbd9CkSC5e9J7Sd0de1OnQrI2wyq6ILexmvAJuff9C9ztTS
 dtrA==
X-Gm-Message-State: AOAM533guUBKR1qA/iqPxzw2wgwNwp8UgdD8hNIDT6/ijaCrxcb/4J4e
 HGp2/QuuL4Q9x2ohmszq983mkHoXhItKlS7w/zPaxdD0DMmV85zuRmFwqGFvM+UgeiYHXHgOL0J
 oJLC6ZePL5/I9uP0kxQ==
X-Received: by 2002:a50:e80a:: with SMTP id e10mr27041451edn.4.1599565730809; 
 Tue, 08 Sep 2020 04:48:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuIrGNYSV5lxSBKYKakdpcCXtpLS/l9xmHol/PWR+iWbWQTImjWDNviJDYQPv5yvM4aXHGyg==
X-Received: by 2002:a50:e80a:: with SMTP id e10mr27041437edn.4.1599565730640; 
 Tue, 08 Sep 2020 04:48:50 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:6c4a:4cae:bef0:843f?
 ([2001:b07:6468:f312:6c4a:4cae:bef0:843f])
 by smtp.gmail.com with ESMTPSA id m2sm6965756ejo.4.2020.09.08.04.48.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 04:48:50 -0700 (PDT)
Subject: Re: [PATCH v2] scripts/git.orderfile: Display meson files along with
 buildsys ones
To: Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <20200907161222.41915-1-philmd@redhat.com>
 <bd658d44-d9bd-81d1-f3c7-89c0d61f6dd2@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <79de1ef4-6e08-6f1c-030e-f40e7410e06c@redhat.com>
Date: Tue, 8 Sep 2020 13:48:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <bd658d44-d9bd-81d1-f3c7-89c0d61f6dd2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 02:10:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.626, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 08 Sep 2020 11:48:59 -0000

On 08/09/20 12:02, Laszlo Ersek wrote:
> Possibly related (not sure if there's another patch pending for it
> already): if you run a "make clean" in the source tree, and have the
> Meson submodule initialized, the "make clean" will delete files from the
> Meson submodule.
> 
> find . \( -name '*.so' -o -name '*.dll' -o -name '*.[oda]' \) -type f \
> 
> "*.d" matches various meson files.
> 
> (Again, apologies if this is already known; I understand this is
> probably the worst context to report his in...)

Is this running "make clean" from an old commit (i.e. as in an in-tree
build) after having checked out the meson submodule?

Paolo



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGybW-0001NG-Ku
	for mharc-qemu-trivial@gnu.org; Sat, 12 Sep 2020 02:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kGybV-0001Mz-S8
 for qemu-trivial@nongnu.org; Sat, 12 Sep 2020 02:01:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36688
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kGybT-0001Wr-4F
 for qemu-trivial@nongnu.org; Sat, 12 Sep 2020 02:01:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599890497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gl2AtlMXNqKvTmPK+6Z4nh0TVjCyOpaXQ00n1fpFNqc=;
 b=RrY+cVFIycz9JgF1LOD3fXvk7rQMvD76KomXurEQcA3JJKbXID1Rg9wcB5fFy0+3uX5sOy
 cug+bSE1V7gMZy8Kils9CuUIwhHgHbemD6bO/Z5BiAOzUro4CkT8ScGnwzxel1cQje7chG
 hAToegmQs3FMOE4C5xHxUjKLofiP3Ok=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-FOrfG1EhMrGpZTUVg_2rlw-1; Sat, 12 Sep 2020 02:01:35 -0400
X-MC-Unique: FOrfG1EhMrGpZTUVg_2rlw-1
Received: by mail-wm1-f72.google.com with SMTP id y18so595067wma.4
 for <qemu-trivial@nongnu.org>; Fri, 11 Sep 2020 23:01:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gl2AtlMXNqKvTmPK+6Z4nh0TVjCyOpaXQ00n1fpFNqc=;
 b=JGu47La/+gI7UIcpwAMTbcK7ef01lsrm9m7K3ZfHv2yM0ZelAEEEA9Q0lSqstweYI2
 +/o0LfF2jgMzS5AchvLSyCqr+oCFRr/Nhy+R171Nl2rsl2pWP4a+xIOGXMxHiR7dC+0o
 jtbJuMi9xqgpoLSWTyywwxcHktAcit6wnuOaqdUJe+yxkImZk742y+V6OofskxgEzXhu
 gyrOpOp0v5OLj1cM6Bix0z//yP7IcAt6nZ39VQzc5Kymr3YEaZNy/ecsM/NFwk3+eLFP
 QOYB2ckwYaH0wpUHjkgCMnwvsR6+spXX7szxVvQQ3NrUDF5vYLszP4/E1aLNCUiJCH/b
 VJCQ==
X-Gm-Message-State: AOAM5336TkG62Z/CSxjSvNThaqxO8v5FcQnzmKZfBlQ35IQnZ+345oxq
 pqNCuBinyFdyUGYdKmOtYYtamDggIvBitWa65c8RwgFRnfQPDWNDQ+7bHuzWQjVM+mhCr3zDWJU
 zbCHuJfMsCZkSh7SkTg==
X-Received: by 2002:a1c:7714:: with SMTP id t20mr5734230wmi.55.1599890494203; 
 Fri, 11 Sep 2020 23:01:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAz3LYjm0ULsjJ7PFs3pE9KI5HeANjEihDIHjNBSdqeZwduh4mU/81Grk535fRy3WpkjP1Bw==
X-Received: by 2002:a1c:7714:: with SMTP id t20mr5734216wmi.55.1599890493915; 
 Fri, 11 Sep 2020 23:01:33 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id m13sm8278190wrr.74.2020.09.11.23.01.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 23:01:33 -0700 (PDT)
Subject: Re: [PATCH v2] scripts/git.orderfile: Display meson files along with
 buildsys ones
To: Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <20200907161222.41915-1-philmd@redhat.com>
 <bd658d44-d9bd-81d1-f3c7-89c0d61f6dd2@redhat.com>
 <79de1ef4-6e08-6f1c-030e-f40e7410e06c@redhat.com>
 <2d435bb0-eb8d-7a12-b962-2bce246c30fb@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3b529fd7-aae4-645e-c956-aa6f9fc2aea5@redhat.com>
Date: Sat, 12 Sep 2020 08:01:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <2d435bb0-eb8d-7a12-b962-2bce246c30fb@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/12 02:01:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.469, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Sat, 12 Sep 2020 06:01:42 -0000

On 08/09/20 14:30, Laszlo Ersek wrote:
> 
> The current working directory is the source tree.
> 
> The working directory is pristine, as in:
> $ git reset --hard
> $ git clean -ffdx
> $ git submodule deinit --force --all
> 
> Then:
> 
> $ git submodule update --init --force
> $ make clean
> $ git status

I see.  We should probably rename the Makefile in the source tree, since
it is only meant to be used from the build tree.

Paolo



Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qHNNo-0005T1-29
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jul 2023 07:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qHNNm-0005Sl-Kq
 for qemu-trivial@nongnu.org; Thu, 06 Jul 2023 07:42:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qHNNi-0007Cp-5f
 for qemu-trivial@nongnu.org; Thu, 06 Jul 2023 07:42:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688643760;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=vcf7QHKLpBXcPUjgGD0oUcQaTofe75gJXZKJMFB7UG8=;
 b=XAp5uyveZAnxE8mEcZgnnPNftNLpY6Od95kCz64ryhK0f7/p3n2BOrVHU1MsInKOzgoBai
 ri+p3g4Q1wiDPX2huA9npHEyj/JdEv4uCp38ogBkYJHm5YfFFEJH+MP3ZjQK4YN3hQmGKk
 aoROJTKwfBbhCZFPZIZRgnIo2xDsNig=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-ezlw1oZyMWi3jinToUH-ZA-1; Thu, 06 Jul 2023 07:42:39 -0400
X-MC-Unique: ezlw1oZyMWi3jinToUH-ZA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3143b999f6eso300432f8f.3
 for <qemu-trivial@nongnu.org>; Thu, 06 Jul 2023 04:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688643758; x=1691235758;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vcf7QHKLpBXcPUjgGD0oUcQaTofe75gJXZKJMFB7UG8=;
 b=B7aj/1rlhWLbMbU6FaTStDfJfKEV9xfvQsghSjlFCsBGCdxo3yMFBfTwzhvtmfqiD1
 10X4MUrQBlLUa8QQb+L/EcEJnRjoY7pXl6fHZaBiaO7LdqhoSA/1OzQ8sU/cb/fLjmSY
 fkLtCo3ryGSS9452UYPrlyut0jdO4aIpANlSzRELp94agIBH4wEjqQDjkwbLGOsGzTH+
 twEajWgpxJDIN4lGUeMdLxgnadP5JuMc5lEeGbQRA3ChMuQp6cJbjqX0O8/knC3o7TeJ
 h1gQnz5e4iRrNly8d84GOq58u3NvBasQt9Ay/zNuWAoWt36vq+MjUUHbWQVrJ0CGmZHz
 gSrQ==
X-Gm-Message-State: ABy/qLb713awfl2nRns9isdPIRjGWlSfO7Zvlh/Xn1cM4GMIVTyu2o+6
 wW42pR1ZT+WAMC43Rs/wgPZigjb+HJw+9oKOhTxhH/LFyJ2NromQAmE2nz5vtFqx7L2fUE0TdTy
 AhDl6pY8BwW6HH65i4Q==
X-Received: by 2002:adf:e34c:0:b0:314:3643:83b5 with SMTP id
 n12-20020adfe34c000000b00314364383b5mr1217712wrj.41.1688643758480; 
 Thu, 06 Jul 2023 04:42:38 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHkF1wWNx/dq/ctP/3CQIYUFC/XB91GkFvtY5pJ7CDF0xg3ezRE13zqQbHeJsf1dfcgUsnF5g==
X-Received: by 2002:adf:e34c:0:b0:314:3643:83b5 with SMTP id
 n12-20020adfe34c000000b00314364383b5mr1217699wrj.41.1688643758217; 
 Thu, 06 Jul 2023 04:42:38 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 k7-20020a5d6287000000b00314417f5272sm1674176wru.64.2023.07.06.04.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 04:42:37 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras <leobras@redhat.com>,  Peter Xu
 <peterx@redhat.com>,  qemu-trivial@nongnu.org
Subject: Re: [PATCH 2/2] migration: unexport migrate_fd_error()
In-Reply-To: <20230706102937.82490-3-lersek@redhat.com> (Laszlo Ersek's
 message of "Thu, 6 Jul 2023 12:29:37 +0200")
References: <20230706102937.82490-1-lersek@redhat.com>
 <20230706102937.82490-3-lersek@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Thu, 06 Jul 2023 13:42:37 +0200
Message-ID: <87wmzd9sgi.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 06 Jul 2023 11:42:46 -0000

Laszlo Ersek <lersek@redhat.com> wrote:
> The only migrate_fd_error() call sites are in "migration/migration.c",
> which is also where we define migrate_fd_error(). Make the function
> static, and remove its declaration from "migration/migration.h".
>
> Cc: Juan Quintela <quintela@redhat.com> (maintainer:Migration)
> Cc: Leonardo Bras <leobras@redhat.com> (reviewer:Migration)
> Cc: Peter Xu <peterx@redhat.com> (reviewer:Migration)
> Cc: qemu-trivial@nongnu.org
> Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=2018404
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.



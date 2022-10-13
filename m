Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oj6ov-0004W4-GE
	for mharc-qemu-trivial@gnu.org; Thu, 13 Oct 2022 18:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oj6ot-0004VQ-Fr
 for qemu-trivial@nongnu.org; Thu, 13 Oct 2022 18:36:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oj6oq-0004W3-4t
 for qemu-trivial@nongnu.org; Thu, 13 Oct 2022 18:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665700604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SvSIAUrjJP/aI3e3XHwepb+xAJAqJVl68OPw0QQP/f0=;
 b=i9U9DyiRfy2C2kxs8ZwjHx11Kmp2oa0s1FcrFE20Uf1xVOjWtsX0hDs4XVg7/XisJavt5P
 7xACl6yo5jkLO3VW3qR0AT/0WSl7e3DtLEGeWUewYuOgFEzs3mQvB7ZwLnGMf/nEHMmI7k
 jz8qUBZ8bPfcLhRQxucu/nmjasLeuR0=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-477-InxU4ojKPqe8_FPjvNlzxA-1; Thu, 13 Oct 2022 18:36:42 -0400
X-MC-Unique: InxU4ojKPqe8_FPjvNlzxA-1
Received: by mail-lj1-f197.google.com with SMTP id
 z13-20020a2e7e0d000000b0026fa9710fb3so1366843ljc.12
 for <qemu-trivial@nongnu.org>; Thu, 13 Oct 2022 15:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SvSIAUrjJP/aI3e3XHwepb+xAJAqJVl68OPw0QQP/f0=;
 b=oq3QL5XSzU24SYNXIA40n6ts2M3JBHFYuGQA767o3+31Es4XdRt9dm8l/tEIDHxLfV
 bElptCihxUrYLl2kskgZYasZcw626VMmrkKAqkIh+qYZ+jFAC+xHpEb/DG/wXWyq0uSs
 p4YKClx2LSV34LIL5cyM+wnWYdQMPVmkY3ZIHGYFU/ybBVKl3JxpZ7XWkzl0BmgvuO/c
 jp9iMgA7iBWy0EeSjzz9jI/c47eshrLAM5p+Rgs/AUCiJeGBn2kf3pq0UgUiyOVQV6aK
 037LlBGYfiasR+T0/vBeNO53K87p5irKPC37Cs1lmSFRSXjv5LGW0TE9HdQlo443bE30
 HJkQ==
X-Gm-Message-State: ACrzQf1cpzk4hLthPrjYV2fn4wj0P6J2PYQVFPPUuYY271nyAidp9CaB
 z0e7hJrV2YN/00RhJocwYfSgKSiOonLzz1U3kYyE1etUlsseBVaijjhcOkdkNpAXgAVaszkHqvz
 4Apf6nQcyNqsAefzFSKZ4lmlRwZpdnottXQ==
X-Received: by 2002:a05:6512:228b:b0:4a2:3e53:4af2 with SMTP id
 f11-20020a056512228b00b004a23e534af2mr620640lfu.280.1665700601198; 
 Thu, 13 Oct 2022 15:36:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6fdH4KoOQy6vl8PIbovVmy4awWaxfxMjwZvwx2puvwO8P3YMpgHM+U7eyw4DadkVYCKk9ISoX9v8N8u6asFLs=
X-Received: by 2002:a05:6512:228b:b0:4a2:3e53:4af2 with SMTP id
 f11-20020a056512228b00b004a23e534af2mr620634lfu.280.1665700600983; Thu, 13
 Oct 2022 15:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220928090312.2537-1-dinglimin@cmss.chinamobile.com>
In-Reply-To: <20220928090312.2537-1-dinglimin@cmss.chinamobile.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 13 Oct 2022 18:36:29 -0400
Message-ID: <CAFn=p-Yw3mjzfV-WaaX+D4zVGrPQ_zcrVXf9U2+7TRuBuLNEog@mail.gmail.com>
Subject: Re: [PATCH] vmstate-static-checker:remove this redundant return
To: dinglimin <dinglimin@cmss.chinamobile.com>
Cc: thuth@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org, 
 qemu-trivial@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 13 Oct 2022 22:36:51 -0000

On Wed, Sep 28, 2022 at 5:06 AM dinglimin
<dinglimin@cmss.chinamobile.com> wrote:
>
> Jump statements, such as return and continue let you
> change the default flow of program execution,
> but jump statements that direct the control flow to
> the original direction are just a waste of keystrokes.
>
> Signed-off-by: dinglimin <dinglimin@cmss.chinamobile.com>
> ---
>  scripts/vmstate-static-checker.py | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/vmstate-static-checker.py b/scripts/vmstate-static-checker.py
> index b369388360..dfeee8231a 100755
> --- a/scripts/vmstate-static-checker.py
> +++ b/scripts/vmstate-static-checker.py
> @@ -367,7 +367,6 @@ def check_machine_type(s, d):
>      if s["Name"] != d["Name"]:
>          print("Warning: checking incompatible machine types:", end=' ')
>          print("\"" + s["Name"] + "\", \"" + d["Name"] + "\"")
> -    return
>
>
>  def main():
> --
> 2.30.0.windows.2
>

This can go through the trivial branch.

Reviewed-by: John Snow <jsnow@redhat.com>



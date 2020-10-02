Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kOPBi-0005tw-Si
	for mharc-qemu-trivial@gnu.org; Fri, 02 Oct 2020 13:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kOPBh-0005rw-2b
 for qemu-trivial@nongnu.org; Fri, 02 Oct 2020 13:49:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kOPBf-0004af-Ev
 for qemu-trivial@nongnu.org; Fri, 02 Oct 2020 13:49:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601660982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5qE2vgyc55FZTYFofewcNWIc54bfVQoSgZCgD3DQVjY=;
 b=JiKjPmBKUWZLoQYqUT5JujvOQv/dhxPEtvv7ZHtKmwr3jExHQj0r2E1bxqS8fIe775y+th
 ic98iZ4wQwUT5WNXZhDWMTQU74+IYD66oUDl+oYfa4Q7TrGdLkGA9x0O3JZDTrTUh7v/iD
 BwTZ+jXcR6496sRKuWxtrl9ePaNolhc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-JQ_ds1dbPbanRBhQ2VuVTw-1; Fri, 02 Oct 2020 13:49:41 -0400
X-MC-Unique: JQ_ds1dbPbanRBhQ2VuVTw-1
Received: by mail-wr1-f71.google.com with SMTP id w7so827267wrp.2
 for <qemu-trivial@nongnu.org>; Fri, 02 Oct 2020 10:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5qE2vgyc55FZTYFofewcNWIc54bfVQoSgZCgD3DQVjY=;
 b=coOegMP72xr7uqAAAdNXQMbnFe3f2cjXfmwBTUtSTkdWAGgblxRcuBnMNfYtOECJ2D
 61Gre7SvcotePFmsYGkkDNuguofGvdwrQK4e6BvX4Odt6n3qeaVaq2DBH0ZiVGz1lq0I
 zBvV4OKlxCdnGb8Ol7erprcgZ7lHNxbBNSkz7ZHEolHy/V44CS0m2FwOjFLN+jVOyx6z
 1fjF49ESy9m/A3tG6wZJMKv2zcSJlOX2ZoGIX1exl5PHxhzceMtpNP0P2k3KOyDPzhzi
 mrI06oHrTNlX5vTzmEzyl08doO6ho2ChLoXHUfNDMFYnqRj+0vdSITGa7lmN2auDosWT
 gegQ==
X-Gm-Message-State: AOAM5314hAvFF+b6zyJuI/NkXBrMOiI/mhtedjYoiZG0tSDzgWZZVFpx
 p5reo7PwxMP+f0W0GBnogddrC1w/s256NOMpNebnlZlseqcn1T+tM3fIKGXeE5TA6XT7lRzVn0d
 RTiY3vAHAEvU/212LZA==
X-Received: by 2002:a1c:35c1:: with SMTP id c184mr4058522wma.161.1601660979945; 
 Fri, 02 Oct 2020 10:49:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8hPwIg2uuzLrr2Y+awvnnqdRrU3UBD+qVOWDe1bxu+eV9oCUjXERnPZnrQqZ4huKZ+xfKQA==
X-Received: by 2002:a1c:35c1:: with SMTP id c184mr4058505wma.161.1601660979698; 
 Fri, 02 Oct 2020 10:49:39 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:47e0:e742:75ba:b84d?
 ([2001:b07:6468:f312:47e0:e742:75ba:b84d])
 by smtp.gmail.com with ESMTPSA id f14sm2717666wme.22.2020.10.02.10.49.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 10:49:39 -0700 (PDT)
Subject: Re: [PATCH v6 2/4] curses: Fixes compiler error that complain don't
 have langinfo.h on msys2/mingw
To: luoyonggang@gmail.com, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, QEMU Trivial
 <qemu-trivial@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201001173230.829-1-luoyonggang@gmail.com>
 <20201001173230.829-3-luoyonggang@gmail.com>
 <20201002153559.GJ2338114@redhat.com>
 <CAE2XoE_z3j+_+Oh1Kn-GSAT4q0_nXnT0sLHMLCw0+r1o0WBJSA@mail.gmail.com>
 <20201002164232.GO2338114@redhat.com>
 <CAE2XoE_+ERRdDgGcisNj0WWMU=rCs49PrikVw6Tk+Ov2TC0+Tw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7998dac5-0bd6-a552-30d4-c567805ad1ed@redhat.com>
Date: Fri, 2 Oct 2020 19:49:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAE2XoE_+ERRdDgGcisNj0WWMU=rCs49PrikVw6Tk+Ov2TC0+Tw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 01:13:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.256, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 02 Oct 2020 17:49:45 -0000

On 02/10/20 19:47, 罗勇刚(Yonggang Luo) wrote:
> Because the configure script change far more complicated than you
> imgaine. And I post that before

Daniel is literally asking for a two-line change:

diff --git a/configure b/configure
index fee5faa054..ffd72b571d 100755
--- a/configure
+++ b/configure
@@ -3671,7 +3671,6 @@ if test "$curses" != "no" ; then
 #include <locale.h>
 #include <curses.h>
 #include <wchar.h>
-#include <langinfo.h>
 int main(void) {
   const char *codeset;
   wchar_t wch = L'w';
@@ -3680,7 +3679,6 @@ int main(void) {
   addwstr(L"wide chars\n");
   addnwstr(&wch, 1);
   add_wch(WACS_DEGREE);
-  codeset = nl_langinfo(CODESET);
   return codeset != 0;
 }
 EOF

Paolo



Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AABCCD1AF
	for <qemu-trivial@archiver.kernel.org>; Tue, 21 Oct 2025 20:33:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vBJ1E-0005TJ-M9; Tue, 21 Oct 2025 16:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJ12-0005Kf-1D
 for qemu-trivial@nongnu.org; Tue, 21 Oct 2025 16:31:35 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJ0w-00063O-32
 for qemu-trivial@nongnu.org; Tue, 21 Oct 2025 16:31:31 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4711f3c386eso30233645e9.0
 for <qemu-trivial@nongnu.org>; Tue, 21 Oct 2025 13:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761078683; x=1761683483; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e46Xpd7tLYIKXwBbt7lbuURVIUXwhDVyJ1/luhq2CqY=;
 b=iD/H9g+cT/nQ66n994jErV6LFlKhc3cwqoXlwyk47j7BaL/Awg3RgzFA8Fk2sscwtz
 4uv4TpgrHxFhU3mDnHqULFtfW2a5Y0Zivzkbma7p+O1d111mDlrxT6NAUZGZ0101E98w
 Vwn0o60u4AqUCTPBxKx3tlbnbnHc05B1aOlyCjS+Vhd2r98vO+xMKgQeP2n7JdtHDT4M
 WHSxCWrNxrxbJ2sRIC9lLm0ppc4nSjPoOaj22PXsNtiJ+3MOmIgmRtyOmURawTk1Vwte
 Y+cfmeJsK4ACWLQSLrx7qX9sIWo++NXaZtSaBMaICF7BqGvdFrx7fnCx4xuoDLJRpfa/
 rZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761078683; x=1761683483;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e46Xpd7tLYIKXwBbt7lbuURVIUXwhDVyJ1/luhq2CqY=;
 b=hJ2N7a3v/09oryvx4wwz6aq9AJmF12Xu3az2pxB+jkmF/9mJ71VFDeSXBY7SHIUMW2
 vrxHrK6LbHF+aP/TH6uo/G2HCmxOwBapHvvHmQzmT7aPBOuLI8W4JB9OVG5MvvLzVXZO
 U4Pj8cX+ovF12i5kiCm9vkgnFzqvoWeGJcneUoEvEl+b2Voe98DQClHrbO7lS7SbeaKo
 LBscI22G4DLkmpe3EIsyQAiQJpBLiI93Upxw2PbFX0Q8o4qhqDl//9HKrWKAdlxK+Wxo
 1965Jvt7iUa1wleLMhkrLcjYNrYSxVghgkOP4TT6DYHp7Jiav8GQdRQ9mXRfcPxiWSLz
 yPdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQ+o9ropCZRP171W9NCy7pThtMVf54JptlmdXxrbyeSfw8FzfOvI5CuyVvutWv2H9UJNyYCgxIwP1buBs=@nongnu.org
X-Gm-Message-State: AOJu0Ywq6Hvo+IIklpjH0c+VIo9h2mVW+YviQdGY9MnEl2BSdIS0lHDw
 82tjOIJ5CiMRPOrqaCCoKDn/fLaOlyzGhqIBpoUPFkpWZyqDzemkjjWreT90/Q2+TEw=
X-Gm-Gg: ASbGncu5B0zCRZxDdr9SxWmBdMdTqregkqIFKklIk0S+Cln/PsBv8GG4CUN9+ae6no3
 nSWpdit+bZYKBJ1CCt3zPxae1J3d6Aek6h3SuyPC4VvlOf+M70sCREK7IaBxB2NDqgdbGGwZ3gN
 oMArR/3dlm523efLUVqBZ5GR68vAwldcM/Y9AO48/ozT3UGUlzO7kcEzvUnfvzTnlSThzZrbsyk
 f9z7JToYLdXrK6u0c+jdgISRk5rfquJOos3xlq+uSp1Om+VMGsrt8flh6yxoxhTLKbtAorywgQ7
 fis73Qfd8OCpY/c+ofsEDZt1V41yeu3K0+hK5yTHJI2kRTQ5MxFXIvond8Wvhza51MJzhkD7tdI
 oXMq8AuLpf5lkuS0sDTQPoUXQZXuuWiUdaBJdjrzPmtIxNlkbhmxRzyKZsleujyrT+ySvVUrbzZ
 Cib5C9khadLum/J8QcnI2PUwkakB+dVM00o4neJJm860wyN/g6CkDbdQ==
X-Google-Smtp-Source: AGHT+IH3MFgzooHeifTv6goalvSCOCkji2kNHftd9bPXF0cgSvPl9wwmDkwJqJSwTixMtYZTPoNSRQ==
X-Received: by 2002:a05:600c:190f:b0:470:feb2:e968 with SMTP id
 5b1f17b1804b1-471178b125amr134414325e9.15.1761078683529; 
 Tue, 21 Oct 2025 13:31:23 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47496c14a26sm23142735e9.4.2025.10.21.13.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 13:31:22 -0700 (PDT)
Message-ID: <e2b73955-13b6-4987-a24c-1b8998597d07@linaro.org>
Date: Tue, 21 Oct 2025 22:31:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] hw/intc/apic: Pass APICCommonState to
 apic_register_{read, write}
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Zhao Liu <zhao1.liu@intel.com>,
 kvm@vger.kernel.org, Michael Tokarev <mjt@tls.msk.ru>,
 Cameron Esfahani <dirty@apple.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Phil Dennis-Jordan
 <phil@philjordan.eu>, John Snow <jsnow@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>
References: <20251019210303.104718-1-shentey@gmail.com>
 <20251019210303.104718-10-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251019210303.104718-10-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

Hi Bernhard,

On 19/10/25 23:03, Bernhard Beschow wrote:
> As per the previous patch, the APIC instance is already available in
> apic_msr_{read,write}, so it can be passed along. It turns out that
> the call to cpu_get_current_apic() is only required in
> apic_mem_{read,write}, so it has been moved there. Longer term,
> cpu_get_current_apic() could be removed entirely if
> apic_mem_{read,write} is tied to a CPU's local address space.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/intc/apic.c | 35 ++++++++++++++++-------------------
>   1 file changed, 16 insertions(+), 19 deletions(-)


> @@ -1054,12 +1046,17 @@ static int apic_register_write(int index, uint64_t val)
>   static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
>                              unsigned size)
>   {
> +    APICCommonState *s = cpu_get_current_apic();
>       int index = (addr >> 4) & 0xff;
>   
>       if (size < 4) {
>           return;
>       }
>   
> +    if (!s) {
> +        return;
> +    }

This is not the correct place to return...

>       if (addr > 0xfff || !index) {
>           /*
>            * MSI and MMIO APIC are at the same memory location,

... because of this comment. See the (squashed) fix below.

> @@ -1073,7 +1070,7 @@ static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
>           return;
>       }
>   
> -    apic_register_write(index, val);
> +    apic_register_write(s, index, val);
>   }

-- >8 --
diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index 077ef18686b..aad253af158 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -1046,30 +1046,30 @@ static int apic_register_write(APICCommonState 
*s, int index, uint64_t val)
  static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
                             unsigned size)
  {
      APICCommonState *s = cpu_get_current_apic();
      int index = (addr >> 4) & 0xff;

      if (size < 4) {
          return;
      }

-    if (!s) {
-        return;
-    }
-
      if (addr > 0xfff || !index) {
          /*
           * MSI and MMIO APIC are at the same memory location,
           * but actually not on the global bus: MSI is on PCI bus
           * APIC is connected directly to the CPU.
           * Mapping them on the global bus happens to work because
           * MSI registers are reserved in APIC MMIO and vice versa.
           */
          MSIMessage msi = { .address = addr, .data = val };
          apic_send_msi(&msi);
          return;
      }

+    if (!s) {
+        return;
+    }
+
      apic_register_write(s, index, val);
  }

---


Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1siy7l-0004Qk-34
	for mharc-qemu-trivial@gnu.org; Tue, 27 Aug 2024 11:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1siy7j-0004PM-Nr
 for qemu-trivial@nongnu.org; Tue, 27 Aug 2024 11:28:47 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1siy7i-0002X3-3d
 for qemu-trivial@nongnu.org; Tue, 27 Aug 2024 11:28:47 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5bf01bdaff0so6081591a12.3
 for <qemu-trivial@nongnu.org>; Tue, 27 Aug 2024 08:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724772524; x=1725377324; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4yAlMlBA4ouTt0DGe3f9cAnewU9Z5AuKZeGQC3oO/yM=;
 b=VjdeJLkZq3A38hsqfxQ8z9jMh2iHOcjFU2vDLOUBeuLczCKkjbEVU3izm7Fbn2pVgQ
 mURYjF0JpUOIE/6z/lDzxoseq2C0Y+yU9e0lA6kkJWS8UEo61F6MBRnPDBHkkqF9PJ8s
 jSURM5tYlCuSdWT/Mn2Ox/CriiOnU2MHIi9iCR+w5AhiGx5BlLoxzxbhVxAdUiXMXlTf
 ZjEQepF7VA5/v4FEaGnjuPmzRc7WizdNuUfEnDzNhSezpUbYnI+a2y9L+wawHqQ7wZ7/
 at+tP1Ell4KRxZYU4l5/uI6EpBqVf/Y9XDMSKXQVCqormXqkqm4bmKNl+h1s7oQSxhj5
 K+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724772524; x=1725377324;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4yAlMlBA4ouTt0DGe3f9cAnewU9Z5AuKZeGQC3oO/yM=;
 b=TesGHBdtcd6KKzOgxUrGj0GkuCWmzq5ELMbKttjj8P5uiHFT5weZicTrwdnJPvU8VV
 boFLHqjhXw6cZ26lvOGkRPtZRk912QFE1Cz01lGb2o+vHcID8f59CIDZlkdkQXmZlo2y
 YISAD9YKwNH68bd3UfP7tOhgtDa+bZjB/M9Jl4TmG53FUz4LFpsou1ellPgH0qALyXz/
 6ns2yBfnLjgtuZ84gvuom++VLdgkHgJsGnp3WCLr4BPUQd83nK2nktjCO++stVTY7505
 N0R0j5ecswdmN/GoKTlQ0WNV32Ea5FTvsrduEHeqUdlM2w+0pqV2m9vNxaY9Zhll2Jcu
 47Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0cv5OgXCwdfegZmGT1T4kFAHPebku+7SvzLgi99I8+p9MKoKXgkhNPeWoYr2dSIEBsxipGdTtIrjTMO4=@nongnu.org
X-Gm-Message-State: AOJu0Ywn5rlSl2nOjth1uYEOJiF5bJmBxUXn+SfYWrZbS+vMTRLuR8ea
 ew0IZ7xmCALkIYLIq5hZE0c235WCJvnuvCBiVclwZzw8t7DEwI3g4GJ94TIb7eg5uWRDLB88ki9
 Lbk2HYLODf+RTCxzqwmukI3pfvJOe9/qNjHjHbw==
X-Google-Smtp-Source: AGHT+IHNXYKP+BrjeVYDN3n2Nvk0pm4G3DyCjzZQTu06RSPdP2LyJjWIHGARVO3uX/jlq7P9dttqNx7mclhmD5yRb5U=
X-Received: by 2002:a05:6402:1f4e:b0:5c0:c4d3:9017 with SMTP id
 4fb4d7f45d1cf-5c0c4d39303mr1334841a12.38.1724772524119; Tue, 27 Aug 2024
 08:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240827151022.37992-1-anisinha@redhat.com>
 <20240827151022.37992-3-anisinha@redhat.com>
In-Reply-To: <20240827151022.37992-3-anisinha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2024 16:28:33 +0100
Message-ID: <CAFEAcA9Xq7S6_-hYkNYdv6-z7tM7xSgDGyC92L19kTm02qScAw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] kvm: refactor core virtual machine creation into
 its own function
To: Ani Sinha <anisinha@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, zhao1.liu@intel.com, cfontana@suse.de,
 armbru@redhat.com, qemu-trivial@nongnu.org, kvm@vger.kernel.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 27 Aug 2024 15:28:48 -0000

On Tue, 27 Aug 2024 at 16:11, Ani Sinha <anisinha@redhat.com> wrote:
>
> Refactoring the core logic around KVM_CREATE_VM into its own separate function
> so that it can be called from other functions in subsequent patches. There is
> no functional change in this patch.

What subsequent patches? This is patch 2 of 2...

thanks
-- PMM


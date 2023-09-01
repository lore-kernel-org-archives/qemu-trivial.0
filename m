Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qc9jy-0005Cx-EC
	for mharc-qemu-trivial@gnu.org; Fri, 01 Sep 2023 15:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <coltonlewis@google.com>)
 id 1qc9jv-0005Ba-IY
 for qemu-trivial@nongnu.org; Fri, 01 Sep 2023 15:23:31 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <coltonlewis@google.com>)
 id 1qc9jr-0001xc-0i
 for qemu-trivial@nongnu.org; Fri, 01 Sep 2023 15:23:31 -0400
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-34ca860051fso7971355ab.2
 for <qemu-trivial@nongnu.org>; Fri, 01 Sep 2023 12:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1693596204; x=1694201004; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Jk8eU1YUzlGph2kkfy1NgH1ax2sGgPgvKzoaDKemgb4=;
 b=oXYkIXYDziSUWq9BrI+1q/q3PyIoPbqLpoJcQ0T+iHUZ62Rh0mVch+W/KKrKPW0YSk
 Uyb0uoPe8JQeSts47aBw93gKdC9AN5n3PbLBFgOGkPRJApzdikjtsWiaWBdxudh32IP0
 GYSaDGabzgO8SWz5Y/bm8TTADOkW/RdLdsYZhLVVEzd5ZeB+QKcjSj7Civ5pL7PBzK1X
 Vvq8NXaWuKot6Oon7+2ESPVQo8jvLxUFfKklkQT7Kw7pe15LatOTGg+NXu8kQlbeYQmQ
 Y5qiJGgTzA8teDOmjmzZKm4VhwBzS237Ri97bpIVup7o8HrVgn83nZuekUHvg0lgFqyY
 //VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693596204; x=1694201004;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jk8eU1YUzlGph2kkfy1NgH1ax2sGgPgvKzoaDKemgb4=;
 b=kcWpKuvscgwf1edIO92XRa8vWT4d+BSasaoFFMTqqZVkz01bfJQuJrbiFP9Zo7q3AJ
 /mL67LbOcehERC+mdXWgqyk9fmJxmH2HKV4hn4RC7xZLUzKrajJ4N6792De1pUGkh+7Y
 S2faOChSXExcdMMPA7BMUT+L/4zD7BocyBueZSGIbAhn3H00ifQP4ipUp7VdMXof8Fv7
 rEjHQX+j9pJofcY0JWtR0eNPnp3Fi0S8fGSKcE894IDiXZ1rN8p2FVt4rKlsFWHo3yDp
 yLn+Jt9KV7+rMc5C5oOK5Wqk0K9i8A8Rttl3BklGG6rRlhZPdE2bJTnAo6c9K6MPxC30
 4aXw==
X-Gm-Message-State: AOJu0YziKf7RFiiFPqdg/TWZ4PUXQXi6kb5S4xBytjfc/4G/oOE8Kuzu
 sJ2WUWpYuXNLRCNxvLr/byv5eA==
X-Google-Smtp-Source: AGHT+IHARIbykt4ZHFf2A2z7AfZBgjkaI7ulhwMgGHyetk3eR9KVbd5UJppbxfa1hzIpHvaB8/atjw==
X-Received: by 2002:a92:d284:0:b0:349:3c0:395d with SMTP id
 p4-20020a92d284000000b0034903c0395dmr3617488ilp.1.1693596203704; 
 Fri, 01 Sep 2023 12:23:23 -0700 (PDT)
Received: from google.com (30.64.135.34.bc.googleusercontent.com.
 [34.135.64.30]) by smtp.gmail.com with ESMTPSA id
 v12-20020a92d24c000000b00345d6e8ded4sm1252896ilg.25.2023.09.01.12.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 12:23:23 -0700 (PDT)
Date: Fri, 1 Sep 2023 19:23:20 +0000
From: Colton Lewis <coltonlewis@google.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] arm64: Restore trapless ptimer access
Message-ID: <ZPI6KNqGGTxxHhCh@google.com>
References: <20230831190052.129045-1-coltonlewis@google.com>
 <20230901-16232ff17690fc32a0feb5df@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230901-16232ff17690fc32a0feb5df@orel>
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=coltonlewis@google.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 01 Sep 2023 19:23:32 -0000

On Fri, Sep 01, 2023 at 09:35:47AM +0200, Andrew Jones wrote:
> On Thu, Aug 31, 2023 at 07:00:52PM +0000, Colton Lewis wrote:
> > Due to recent KVM changes, QEMU is setting a ptimer offset resulting
> > in unintended trap and emulate access and a consequent performance
> > hit. Filter out the PTIMER_CNT register to restore trapless ptimer
> > access.
> >
> > Quoting Andrew Jones:
> >
> > Simply reading the CNT register and writing back the same value is
> > enough to set an offset, since the timer will have certainly moved
> > past whatever value was read by the time it's written.  QEMU
> > frequently saves and restores all registers in the get-reg-list array,
> > unless they've been explicitly filtered out (with Linux commit
> > 680232a94c12, KVM_REG_ARM_PTIMER_CNT is now in the array). So, to
> > restore trapless ptimer accesses, we need a QEMU patch to filter out
> > the register.
> >
> > See
> > https://lore.kernel.org/kvmarm/gsntttsonus5.fsf@coltonlewis-kvm.c.googlers.com/T/#m0770023762a821db2a3f0dd0a7dc6aa54e0d0da9
>
> The link can be shorter with
>
> https://lore.kernel.org/all/20230823200408.1214332-1-coltonlewis@google.com/

I will keep that in mind next time.

> > for additional context.
> >
> > Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
>
> Thanks for the testing and posting, Colton. Please add your s-o-b and a
> Tested-by tag as well.

Assuming it is sufficient to add here instead of reposting the whole patch:

Signed-off-by: Colton Lewis <coltonlewis@google.com>
Tested-by: Colton Lewis <coltonlewis@google.com>

> > ---
> >  target/arm/kvm64.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > index 4d904a1d11..2dd46e0a99 100644
> > --- a/target/arm/kvm64.c
> > +++ b/target/arm/kvm64.c
> > @@ -672,6 +672,7 @@ typedef struct CPRegStateLevel {
> >   */
> >  static const CPRegStateLevel non_runtime_cpregs[] = {
> >      { KVM_REG_ARM_TIMER_CNT, KVM_PUT_FULL_STATE },
> > +    { KVM_REG_ARM_PTIMER_CNT, KVM_PUT_FULL_STATE },
> >  };
> >
> >  int kvm_arm_cpreg_level(uint64_t regidx)
> > --
> > 2.42.0.283.g2d96d420d3-goog
> >


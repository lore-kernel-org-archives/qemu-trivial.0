Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sCIhm-0003BM-Rq
	for mharc-qemu-trivial@gnu.org; Wed, 29 May 2024 08:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sCIhk-0003AR-QG
 for qemu-trivial@nongnu.org; Wed, 29 May 2024 08:46:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sCIhW-0007WE-Fu
 for qemu-trivial@nongnu.org; Wed, 29 May 2024 08:46:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716986801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uVMDKm04epXl+SRHoDfd5QIbcdAd2LbbZjlVtYq7c6Y=;
 b=YzBhT661y8GfMVTG4YGmlT6RlF4v/1PV7uzSOZbOwkFO/ZstTtY7zvZ6VzNyUEEv+iQrpH
 adYcV5Cg/v6IY5/C6NsYd7VZn+E3HX62AUUGJK6oOgrJqH7biIFdLzN6IIkvZlcpaalaF/
 v2W8Ge2YP7asaM9wVInvp5lD80soZ4E=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-0fjrEguJN6SK4keZMcLLrw-1; Wed, 29 May 2024 08:46:40 -0400
X-MC-Unique: 0fjrEguJN6SK4keZMcLLrw-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2e95a2fc8e3so18722441fa.0
 for <qemu-trivial@nongnu.org>; Wed, 29 May 2024 05:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716986797; x=1717591597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uVMDKm04epXl+SRHoDfd5QIbcdAd2LbbZjlVtYq7c6Y=;
 b=FxoLdZxpUQ9k+j4hDQvjqiUXL2+ecdP4BztIePktNtc6nqOGJFWSuuGG5XlRx4Flt7
 ZspmaQtXKi5Z/MNeKsPRZWNU+fj/W51CKnVlxd8tZ8T3spfUtnCBUJBzcs2yHFnzlNik
 Mw69FheIR8xMEy/aFH2sYn9u+Pr9hsQTEwyKvddQGvAYT0BnBxEgubYmDDfHZeduFFb2
 DU6n5LLuaAgrlkJk5X/pOOUpr8IqrGuIILP5J3Ps7J+J8Lun26YzZClNeXMwrkOlJQ+Y
 4MPf7Fs9laUkt+u+qBZdI7BIlhjaOY3znd/tw8SCrwtFeekKIblMricd55JwV/qy4GBQ
 6WqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4PdzQv9bcA6aDjKXhdgCz263IuzUI1sWNNT1AzrmfCMKUS0bfBqb/bE5nbJc+8v6m8abfcEsBMMpUpg+et+feYCr5tr/F8A==
X-Gm-Message-State: AOJu0YzTdkTgsGeEZzxt3deXj9RwYmSGa6LI+ymXN5RIbyhtT0CN8yPY
 wfOg9/q3Rm6SzIJht0y+zSI2afTzk7mfeAoC1BvpSvF+E7VgoCFq5seUwXJDkFqTyk2UuBHlt6+
 I8DmzVaiTyZnF2J1k9wuUDAB8bNaEUMbrQBpziuajyXaMW904iS7ecBJjdrnz4AU=
X-Received: by 2002:a05:651c:20f:b0:2e9:8833:adf2 with SMTP id
 38308e7fff4ca-2e98833b01amr31841911fa.8.1716986797345; 
 Wed, 29 May 2024 05:46:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNPfkBRBLPfW91C+KFvrGA4fXlvgZatsqhvKrg7oItxt91tvdnWQ5gQRFSE5xUnnS79dLBFQ==
X-Received: by 2002:a05:651c:20f:b0:2e9:8833:adf2 with SMTP id
 38308e7fff4ca-2e98833b01amr31841721fa.8.1716986796874; 
 Wed, 29 May 2024 05:46:36 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42108970967sm179653065e9.17.2024.05.29.05.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 05:46:36 -0700 (PDT)
Date: Wed, 29 May 2024 14:46:34 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Chen, Zide" <zide.chen@intel.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, mst@redhat.com,
 thuth@redhat.com, cfontana@suse.de, xiaoyao.li@intel.com,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH V2 0/3] improve -overcommit cpu-pm=on|off
Message-ID: <20240529144634.40aa597f@imammedo.users.ipa.redhat.com>
In-Reply-To: <29944dba-7005-496d-81ff-1cbc77c67f15@intel.com>
References: <20240524200017.150339-1-zide.chen@intel.com>
 <20240528112327.634e95a6@imammedo.users.ipa.redhat.com>
 <29944dba-7005-496d-81ff-1cbc77c67f15@intel.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.036,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 29 May 2024 12:46:57 -0000

On Tue, 28 May 2024 11:16:59 -0700
"Chen, Zide" <zide.chen@intel.com> wrote:

> On 5/28/2024 2:23 AM, Igor Mammedov wrote:
> > On Fri, 24 May 2024 13:00:14 -0700
> > Zide Chen <zide.chen@intel.com> wrote:
> >   
> >> Currently, if running "-overcommit cpu-pm=on" on hosts that don't
> >> have MWAIT support, the MWAIT/MONITOR feature is advertised to the
> >> guest and executing MWAIT/MONITOR on the guest triggers #UD.  
> > 
> > this is missing proper description how do you trigger issue
> > with reproducer and detailed description why guest sees MWAIT
> > when it's not supported by host.  
> 
> If "overcommit cpu-pm=on" and "-cpu hpst" are present, as shown in the
it's bette to provide full QEMU CLI and host/guest kernels used and what
hardware was used if it's relevant so others can reproduce problem.

> following, CPUID_EXT_MONITOR is set after x86_cpu_filter_features(), so
> that it doesn't have a chance to check MWAIT against host features and
> will be advertised to the guest regardless of whether it's supported by
> the host or not.
> 
> x86_cpu_realizefn()
>   x86_cpu_filter_features()
>   cpu_exec_realizefn()
>     kvm_cpu_realizefn
>       host_cpu_realizefn
>         host_cpu_enable_cpu_pm
>           env->features[FEAT_1_ECX] |= CPUID_EXT_MONITOR;
> 
> 
> If it's not supported by the host, executing MONITOR or MWAIT
> instructions from the guest triggers #UD, no matter MWAIT_EXITING
> control is set or not.

If I recall right, kvm was able to emulate mwait/monitor.
So question is why it leads to exception instead?



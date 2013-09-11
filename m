Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VJkzh-000812-3H
	for mharc-qemu-trivial@gnu.org; Wed, 11 Sep 2013 10:02:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VJkza-0007rL-F7
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 10:02:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VJkzU-0002Ey-Tn
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 10:02:02 -0400
Received: from mail-ye0-x230.google.com ([2607:f8b0:4002:c04::230]:63705)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1VJkzJ-0002Bl-Nh; Wed, 11 Sep 2013 10:01:45 -0400
Received: by mail-ye0-f176.google.com with SMTP id m4so3097944yen.35
	for <multiple recipients>; Wed, 11 Sep 2013 07:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=W22VMOEeC+OE0fi8r22HhglzdWgMeT3XoVaDNNcJtxg=;
	b=sTVvfi/KGZoctr4S5ZlaUAaDrUsRyhdtOOqnYpoFgcLdOMTaMMVBV+KkdUetmsi5cU
	WK3No1aGJ+BPJYSRKRDifk/XusZgPpZeuNx5eBiLEuUw50jVMGFidQos9IziaeMpn0Iv
	9YMLtZXp4XL+ZxYCVESU3rU1WkfEnJUzHJRjo9B9/FsRmRxBrdmiIGJ2wdYc/p5ULqpG
	9a0w3sBT9BfmRMfzXRr0t/SMwdfV3on4Jo45bJ0KZjBGZwxgVYtU/Wt7YhBGsKB8o9se
	vGqmclEcqETm+YvhjUCXEM/ONISSeacvqoD2/ywz7CHRA6tbpwHlL/zmEzSukYhcL0cK
	ts0g==
X-Received: by 10.236.86.42 with SMTP id v30mr1234309yhe.92.1378908104640;
	Wed, 11 Sep 2013 07:01:44 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-117-144-28.cust.dsl.vodafone.it. [37.117.144.28])
	by mx.google.com with ESMTPSA id
	s46sm32729431yha.27.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 11 Sep 2013 07:01:43 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <523077CE.6070303@redhat.com>
Date: Wed, 11 Sep 2013 16:01:50 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Gabriel Kerneis <gabriel@kerneis.info>
References: <1378906912-14015-1-git-send-email-gabriel@kerneis.info>
In-Reply-To: <1378906912-14015-1-git-send-email-gabriel@kerneis.info>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c04::230
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Quote extra_cflags in config-host.mak
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Sep 2013 14:02:08 -0000

Il 11/09/2013 15:41, Gabriel Kerneis ha scritto:
> The variable extra_cflags needs to be quoted in config-host.mak,
> in particular because it might contain parentheses that would
> otherwise be interpreted by the shell when reloading the file.
> 
> For instance, if one wants to define some attribute with configure:
> 
> ./configure --extra-cflags="-Dcoroutine_fn='__attribute__((coroutine_fn))'"
> 
> A more robust approach would be to escape every variable properly, but
> there is no portable equivalent to bash's "printf %q" solution. The
> current patch, while not bullet-proof, works well in the common case.
> 
> Signed-off-by: Gabriel Kerneis <gabriel@kerneis.info>

Where does the shell read config-host.mak?  Make does not need the quotes.

Paolo


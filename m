Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNjCd-00027p-65
	for mharc-qemu-trivial@gnu.org; Tue, 08 Nov 2011 05:46:51 -0500
Received: from eggs.gnu.org ([140.186.70.92]:41031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNjCa-0001wV-6Z
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 05:46:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNjCZ-00022c-7l
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 05:46:48 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:47086)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RNjCS-00021g-7T; Tue, 08 Nov 2011 05:46:40 -0500
Received: by faap15 with SMTP id p15so457755faa.4
	for <multiple recipients>; Tue, 08 Nov 2011 02:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bO2QfqPBkL8mookczU+QnN8HV8cjsOzjbew+HxvN1Iw=;
	b=q6hOugRTVfwSEnf3r5Jhs+PQhweWXTkoJ6P/r4Q995JFg9t8JDdZ/Zt04Fj9IKUpMe
	f6jpIPvKy0aNvMHWiRwjjejfJrGVxO6iJJPAk9YP1/bzeSTa5qCCn+zNR9M35uzwLziR
	4KEZj9s2zPUsgExg3SE/YSoeE4OkiRh9diJro=
Received: by 10.223.91.73 with SMTP id l9mr53919832fam.22.1320749199278;
	Tue, 08 Nov 2011 02:46:39 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id i3sm1718904faf.0.2011.11.08.02.46.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Nov 2011 02:46:38 -0800 (PST)
Date: Tue, 8 Nov 2011 10:44:41 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Message-ID: <20111108104441.GA18080@stefanha-thinkpad.localdomain>
References: <4EB45011.6070609@tribudubois.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4EB45011.6070609@tribudubois.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	paul@codesourcery.com
Subject: Re: [Qemu-trivial] [PATCH] arm: Fix CP15 FSR (C5) domain setting
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
X-List-Received-Date: Tue, 08 Nov 2011 10:46:49 -0000

On Fri, Nov 04, 2011 at 09:50:25PM +0100, Jean-Christophe DUBOIS wrote:
> During Xvisor development, it was noted that qemu did not return
> the correct domain value in the Cp15 [Data] FSR register (C5).
> 
> This patch is a proposal to fix it.
> 
> Signed-off-by: Jean-Christophe DUBOIS <jcd@tribudubois.net>
> ---

CCed Peter Maydell so this can go through the ARM tree.

Stefan


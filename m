Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5U39-0002zU-Tv
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2012 22:29:55 -0500
Received: from eggs.gnu.org ([208.118.235.92]:38816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wangsuyi640@gmail.com>) id 1S5U37-0002zK-8O
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 22:29:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wangsuyi640@gmail.com>) id 1S5U35-0002KH-1K
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 22:29:52 -0500
Received: from mail-wi0-f173.google.com ([209.85.212.173]:42461)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wangsuyi640@gmail.com>) id 1S5U34-0002KA-LK
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 22:29:50 -0500
Received: by wibhi18 with SMTP id hi18so40546wib.4
	for <qemu-trivial@nongnu.org>; Wed, 07 Mar 2012 19:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=WLR5MJ2mtoHGH4kLDGJu2fgSvnvGom7IDaGG8hLxcy8=;
	b=juvgGZv/3a+l5Q5ttz2GqdQg7/pw1PTlMOyLKIoq+BlFiTdhg52k09esS4PShi5IvW
	AS6WJVXVn5INHcAmlVUeUKcgMeI5jmuRRsVlDi8oYK2qx68KdaTJygMHS+tr/DZp8ufP
	O0ehVGUHQGvKWZf4mAR0MAJP2xbnTcaw1d8k765SLWE/wufPaOCnyGOWdeKnwVaPub7Q
	SLVE+Ous9R3CuV2/YK1IZcQv0ccx2wGaiow9Xi4LDKFVWaw67C1ZMUNb1JTlJ4fTxBqh
	Jl3bS99XayXo01Sk/HsOJYS+5IJVYf7P1Tb9almHPt36FdHzg3IyAhGySo+ks8jBGjdm
	95gQ==
MIME-Version: 1.0
Received: by 10.180.100.33 with SMTP id ev1mr10506769wib.3.1331177388750; Wed,
	07 Mar 2012 19:29:48 -0800 (PST)
Received: by 10.216.15.16 with HTTP; Wed, 7 Mar 2012 19:29:48 -0800 (PST)
Date: Thu, 8 Mar 2012 11:29:48 +0800
Message-ID: <CAJVCiVRrRvB7f0PRw0obpEAYi9rebvOHPNG2uHnghfkRVwrJCA@mail.gmail.com>
From: suyi wang <wangsuyi640@gmail.com>
To: qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary=f46d0444026663b8de04bab2e3e0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.173
Subject: [Qemu-trivial] do_spice_init error on Ubuntu11.10
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
X-List-Received-Date: Thu, 08 Mar 2012 03:29:55 -0000

--f46d0444026663b8de04bab2e3e0
Content-Type: text/plain; charset=ISO-8859-1

Hi all:

I tried kvm on my ubuntu  with the libvirt.xml file as follows:
   <domain type='kvm'>
       <name>instance-00000011</
name>
       <memory>2097152</memory>
       <os>
               <type>hvm</type>
               <boot dev="hd" />
       </os>
       <features>
           <acpi/>
       </features>
       <vcpu>1</vcpu>
       <devices>
       <sound model='ac97'/>
       <input type='tablet' bus='usb'/>
           <disk type='file'>
               <driver type='qcow2'/>
               <source
   file='/opt/stack/nova/nova/../
/instances/instance-00000011/disk'/>
               <target dev='vda' bus='ide'/>
           </disk>
               <disk type='file'>
                   <driver type='qcow2'/>
                   <source

- Ignored:
   file='/opt/stack/nova/nova/..//instances/instance-00000011/disk.local'/>
                   <target dev='vdb' bus='ide'/>
               </disk>

           <interface type='bridge'>
               <source bridge='br100'/>
               <mac address='02:16:3e:44:a1:dd'/>
               <filterref
   filter="nova-instance-instance-00000011-02163e44a1dd">
                   <parameter name="IP" value="10.0.0.2" />
                   <parameter name="DHCPSERVER" value="10.0.0.1" />
               </filterref>
           </interface>

           <!-- The order is significant here.  File must be defined first
-->
           <serial type="file">
               <source
   path='/opt/stack/nova/nova/..//instances/instance-00000011/console.log'/>
               <target port='1'/>
           </serial>

           <console type='pty' tty='/dev/pts/2'>
               <source path='/dev/pts/2'/>
               <target port='0'/>
           </console>

           <serial type='pty'>
               <source path='/dev/pts/2'/>
               <target port='0'/>
           </serial>


           <graphics type='vnc' port='-1' autoport='yes' keymap='en-us'
   listen='0.0.0.0'/>

       </devices>
   </domain>

   So it works well.

   Howerver, I want change the remote access method by spice, I simply
changed
   the libvirt.xml as follows:
   <domain type='kvm'>
       <name>instance-00000011</name>
       <memory>2097152</memory>
       <os>
               <type>hvm</type>
               <boot dev="hd" />
       </os>
       <features>
           <acpi/>
       </features>
       <vcpu>1</vcpu>
       <devices>
       <sound model='ac97'/>
       <input type='tablet' bus='usb'/>
           <disk type='file'>
               <driver type='qcow2'/>
               <source
   file='/opt/stack/nova/nova/..//instances/instance-00000011/disk'/>
               <target dev='vda' bus='ide'/>
           </disk>
               <disk type='file'>
                   <driver type='qcow2'/>
                   <source
   file='/opt/stack/nova/nova/..//instances/instance-00000011/disk.local'/>
                   <target dev='vdb' bus='ide'/>
               </disk>

           <interface type='bridge'>
               <source bridge='br100'/>
               <mac address='02:16:3e:44:a1:dd'/>
               <filterref
   filter="nova-instance-instance-00000011-02163e44a1dd">
                   <parameter name="IP" value="10.0.0.2" />
                   <parameter name="DHCPSERVER" value="10.0.0.1" />
               </filterref>
           </interface>

           <!-- The order is significant here.  File must be defined first
-->
           <serial type="file">
               <source
   path='/opt/stack/nova/nova/..//instances/instance-00000011/console.log'/>
               <target port='1'/>
           </serial>

           <console type='pty' tty='/dev/pts/2'>
               <source path='/dev/pts/2'/>
               <target port='0'/>
           </console>

           <serial type='pty'>
               <source path='/dev/pts/2'/>
               <target port='0'/>
           </serial>


           <graphics type='spice' port='-1' autoport='yes' keymap='en-us'
   listen='0.0.0.0'/>

       </devices>
   </domain>

   As you can see, I just change <graphics type='vnc' port='-1'
autoport='yes'
   keymap='en-us' listen='0.0.0.0'/> to <graphics type='spice' port='-1'
   autoport='yes' keymap='en-us' listen='0.0.0.0'/>   ,   But it called the
   error as follows:

   libvirtError: internal error Process exited while reading console log
   output: char device redirected to /dev/pts/12
   TRACE: do_spice_init: starting 0.8.1
   TRACE: do_spice_init: statistics shm_open failed, Permission denied"


Then I also  tried "ls -ld /dev/shm"   ,  yes, it is already  777.
then my problem remained:
libvirtError: internal error Process exited while reading console log
   output: char device redirected to /dev/pts/12
   TRACE: do_spice_init: starting 0.8.1
   TRACE: do_spice_init: statistics shm_open failed, Permission denied"


   I wish someone can give me some help! Thanks!

-- 
Yours.
suyi

--f46d0444026663b8de04bab2e3e0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br clear=3D"all">Hi all: <br>
<br>
I tried kvm on my ubuntu =A0with the libvirt.xml file as follows:<br>

 =A0 =A0&lt;domain type=3D&#39;kvm&#39;&gt;<br>

 =A0 =A0 =A0 =A0&lt;name&gt;instance-00000011&lt;/
<div>name&gt;<br>
 =A0 =A0 =A0 =A0&lt;memory&gt;2097152&lt;/memory&gt;<br>
 =A0 =A0 =A0 =A0&lt;os&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;type&gt;hvm&lt;/type&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;boot dev=3D&quot;hd&quot; /&gt;<br>
 =A0 =A0 =A0 =A0&lt;/os&gt;<br>
 =A0 =A0 =A0 =A0&lt;features&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;acpi/&gt;<br>
 =A0 =A0 =A0 =A0&lt;/features&gt;<br>
 =A0 =A0 =A0 =A0&lt;vcpu&gt;1&lt;/vcpu&gt;<br>
 =A0 =A0 =A0 =A0&lt;devices&gt;<br>
 =A0 =A0 =A0 =A0&lt;sound model=3D&#39;ac97&#39;/&gt;<br>
 =A0 =A0 =A0 =A0&lt;input type=3D&#39;tablet&#39; bus=3D&#39;usb&#39;/&gt;<=
br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;disk type=3D&#39;file&#39;&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;driver type=3D&#39;qcow2&#39;/&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;source<br>
 =A0 =A0file=3D&#39;/opt/stack/nova/nova/../<div>/instances/instance-000000=
11/disk&#39;/&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;target dev=3D&#39;vda&#39; bus=3D&#39;i=
de&#39;/&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;/disk&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;disk type=3D&#39;file&#39;&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;driver type=3D&#39;qcow2&#39;/&=
gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;source<br>
<br>
- Ignored:<br>
 =A0 =A0file=3D&#39;/opt/stack/nova/nova/..//instances/instance-00000011/di=
sk.local&#39;/&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;target dev=3D&#39;vdb&#39; bus=
=3D&#39;ide&#39;/&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;/disk&gt;<br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;interface type=3D&#39;bridge&#39;&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;source bridge=3D&#39;br100&#39;/&gt;<br=
>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;mac address=3D&#39;02:16:3e:44:a1:dd&#3=
9;/&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;filterref<br>
 =A0 =A0filter=3D&quot;nova-instance-instance-00000011-02163e44a1dd&quot;&g=
t;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;parameter name=3D&quot;IP&quot;=
 value=3D&quot;10.0.0.2&quot; /&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;parameter name=3D&quot;DHCPSERV=
ER&quot; value=3D&quot;10.0.0.1&quot; /&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;/filterref&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;/interface&gt;<br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;!-- The order is significant here. =A0File must=
 be defined first --&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;serial type=3D&quot;file&quot;&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;source<br>
 =A0 =A0path=3D&#39;/opt/stack/nova/nova/..//instances/instance-00000011/co=
nsole.log&#39;/&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;target port=3D&#39;1&#39;/&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;/serial&gt;<br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;console type=3D&#39;pty&#39; tty=3D&#39;/dev/pt=
s/2&#39;&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;source path=3D&#39;/dev/pts/2&#39;/&gt;=
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;target port=3D&#39;0&#39;/&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;/console&gt;<br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;serial type=3D&#39;pty&#39;&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;source path=3D&#39;/dev/pts/2&#39;/&gt;=
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;target port=3D&#39;0&#39;/&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;/serial&gt;<br>
<br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;graphics type=3D&#39;vnc&#39; port=3D&#39;-1&#3=
9; autoport=3D&#39;yes&#39; keymap=3D&#39;en-us&#39;<br>
 =A0 =A0listen=3D&#39;0.0.0.0&#39;/&gt;<br>
<br>
 =A0 =A0 =A0 =A0&lt;/devices&gt;<br>
 =A0 =A0&lt;/domain&gt;<br>
<br>
 =A0 =A0So it works well.<br>
<br>
 =A0 =A0Howerver, I want change the remote access method by spice, I simply=
 changed<br>
 =A0 =A0the libvirt.xml as follows:<br>
 =A0 =A0&lt;domain type=3D&#39;kvm&#39;&gt;<br>
 =A0 =A0 =A0 =A0&lt;name&gt;instance-00000011&lt;/name&gt;<br>
 =A0 =A0 =A0 =A0&lt;memory&gt;2097152&lt;/memory&gt;<br>
 =A0 =A0 =A0 =A0&lt;os&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;type&gt;hvm&lt;/type&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;boot dev=3D&quot;hd&quot; /&gt;<br>
 =A0 =A0 =A0 =A0&lt;/os&gt;<br>
 =A0 =A0 =A0 =A0&lt;features&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;acpi/&gt;<br>
 =A0 =A0 =A0 =A0&lt;/features&gt;<br>
 =A0 =A0 =A0 =A0&lt;vcpu&gt;1&lt;/vcpu&gt;<br>
 =A0 =A0 =A0 =A0&lt;devices&gt;<br>
 =A0 =A0 =A0 =A0&lt;sound model=3D&#39;ac97&#39;/&gt;<br>
 =A0 =A0 =A0 =A0&lt;input type=3D&#39;tablet&#39; bus=3D&#39;usb&#39;/&gt;<=
br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;disk type=3D&#39;file&#39;&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;driver type=3D&#39;qcow2&#39;/&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;source<br>
 =A0 =A0file=3D&#39;/opt/stack/nova/nova/..//instances/instance-00000011/di=
sk&#39;/&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;target dev=3D&#39;vda&#39; bus=3D&#39;i=
de&#39;/&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;/disk&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;disk type=3D&#39;file&#39;&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;driver type=3D&#39;qcow2&#39;/&=
gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;source<br>
 =A0 =A0file=3D&#39;/opt/stack/nova/nova/..//instances/instance-00000011/di=
sk.local&#39;/&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;target dev=3D&#39;vdb&#39; bus=
=3D&#39;ide&#39;/&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;/disk&gt;<br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;interface type=3D&#39;bridge&#39;&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;source bridge=3D&#39;br100&#39;/&gt;<br=
>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;mac address=3D&#39;02:16:3e:44:a1:dd&#3=
9;/&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;filterref<br>
 =A0 =A0filter=3D&quot;nova-instance-instance-00000011-02163e44a1dd&quot;&g=
t;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;parameter name=3D&quot;IP&quot;=
 value=3D&quot;10.0.0.2&quot; /&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;parameter name=3D&quot;DHCPSERV=
ER&quot; value=3D&quot;10.0.0.1&quot; /&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;/filterref&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;/interface&gt;<br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;!-- The order is significant here. =A0File must=
 be defined first --&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;serial type=3D&quot;file&quot;&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;source<br>
 =A0 =A0path=3D&#39;/opt/stack/nova/nova/..//instances/instance-00000011/co=
nsole.log&#39;/&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;target port=3D&#39;1&#39;/&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;/serial&gt;<br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;console type=3D&#39;pty&#39; tty=3D&#39;/dev/pt=
s/2&#39;&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;source path=3D&#39;/dev/pts/2&#39;/&gt;=
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;target port=3D&#39;0&#39;/&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;/console&gt;<br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;serial type=3D&#39;pty&#39;&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;source path=3D&#39;/dev/pts/2&#39;/&gt;=
<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;target port=3D&#39;0&#39;/&gt;<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;/serial&gt;<br>
<br>
<br>
 =A0 =A0 =A0 =A0 =A0 =A0&lt;graphics type=3D&#39;spice&#39; port=3D&#39;-1&=
#39; autoport=3D&#39;yes&#39; keymap=3D&#39;en-us&#39;<br>
 =A0 =A0listen=3D&#39;0.0.0.0&#39;/&gt;<br>
<br>
 =A0 =A0 =A0 =A0&lt;/devices&gt;<br>
 =A0 =A0&lt;/domain&gt;<br>
<br>
 =A0 =A0As you can see, I just change &lt;graphics type=3D&#39;vnc&#39; por=
t=3D&#39;-1&#39; autoport=3D&#39;yes&#39;<br>
 =A0 =A0keymap=3D&#39;en-us&#39; listen=3D&#39;0.0.0.0&#39;/&gt; to &lt;gra=
phics type=3D&#39;spice&#39; port=3D&#39;-1&#39;<br>
 =A0 =A0autoport=3D&#39;yes&#39; keymap=3D&#39;en-us&#39; listen=3D&#39;0.0=
.0.0&#39;/&gt; =A0 , =A0 But it called the<br>
 =A0 =A0error as follows:<br>
<br>
 =A0 =A0libvirtError: internal error Process exited while reading console l=
og<br>
 =A0 =A0output: char device redirected to /dev/pts/12<br>
 =A0 =A0TRACE: do_spice_init: starting 0.8.1<br>
 =A0 =A0TRACE: do_spice_init: statistics shm_open failed, Permission denied=
&quot;<br>
  <br>
  <br>
Then I also=A0 tried &quot;ls -ld /dev/shm&quot; =A0 , =A0yes, it is alread=
y=A0 777.<br>

then my problem remained:<br>

libvirtError: internal error Process exited while reading console log<br>

 =A0 =A0output: char device redirected to /dev/pts/12<br>

 =A0 =A0TRACE: do_spice_init: starting 0.8.1<br>

 =A0 =A0TRACE: do_spice_init: statistics shm_open failed, Permission denied=
&quot;<br>
<br>
<br>
 =A0 =A0I wish someone can give me some help! Thanks!</div></div><br>-- <br=
>Yours.<br>suyi<br><br>

--f46d0444026663b8de04bab2e3e0--

